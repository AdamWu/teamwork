package com.projectm.project.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.framework.common.AjaxResult;
import com.projectm.mapper.CommMapper;
import com.projectm.project.domain.ProjectTemplate;
import com.projectm.project.mapper.ProjectTemplateMapper;
import com.projectm.task.domain.TaskStagesTemplete;
import com.projectm.task.mapper.TaskStagesTempleteMapper;
import com.projectm.task.service.TaskStagesTempleteService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ProjectTemplateService extends ServiceImpl<ProjectTemplateMapper, ProjectTemplate>{

    @Autowired
    private TaskStagesTempleteService taskStagesTempleteService;
    @Autowired
    CommMapper commMapper;
    @Autowired
    private TaskStagesTempleteMapper taskStagesTempleteMapper;


    //根据orginationCode获取模板清单
    public IPage<ProjectTemplate> getProTemplateByOrgCode(ProjectTemplate projectTemplete){

        LambdaQueryWrapper<ProjectTemplate> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProjectTemplate::getOrganization_code, projectTemplete.getOrganization_code());
        if(-1 != projectTemplete.getIs_system()){
            queryWrapper.eq(ProjectTemplate::getIs_system, projectTemplete.getIs_system());
        }
        IPage<ProjectTemplate> mapIPage = baseMapper.selectPage(projectTemplete.toPage(),queryWrapper);
        return mapIPage;
    }

    public IPage<Map> getProTemplateByOrgCode(IPage<Map> ipage,Map params){
        return baseMapper.getProTemplateByOrgCode(ipage,params);
    }

    public IPage<Map> getProjectTemplateIndex(IPage<Map> page,Map params){
        String memberCode = MapUtils.getString(params,"memberCode");
        String orgCode = MapUtils.getString(params,"orgCode");
        Integer viewType = MapUtils.getInteger(params,"viewType",-1);
        String sql = " select * from team_project_template as pt ";
        if(-1 == viewType){
            sql += String.format("  where pt.organization_code = '%s' or pt.is_system = 1",orgCode);
        }else if(1==viewType){
            sql += " where pt.is_system = 1";
        }else if(0==viewType){
            sql += String.format(" where pt.organization_code = '%s' and pt.is_system = 0",orgCode);
        }
        page = commMapper.customQueryItem(page,sql);
        List<Map> records = page.getRecords();
        List<Map> resultRecoreds = new ArrayList<>();
        if(CollectionUtils.isNotEmpty(records)){
            records.stream().forEach(map -> {
                map.put("task_stages",taskStagesTempleteMapper.selectByProjectTempleteCode(MapUtils.getString(map,"code")));
                resultRecoreds.add(map);
            });
        }
        page.setRecords(resultRecoreds);
        return page;
    }

    //添加项目模板和模板任务
    @Transactional
    public void saveProjectTemplateAndTaskStagesTemplage(ProjectTemplate pt, List<TaskStagesTemplete> lists){
        save(pt);
        taskStagesTempleteService.saveBatch(lists);
    }

    //删除模板和模板任务
    @Transactional
    public void deleteProjectTemplateAndTaskStagesTemplage(Integer ptId, List<Integer> lists){
        baseMapper.deleteById(ptId);
        taskStagesTempleteService.removeByIds(lists);
    }

    //根据 code获取projectTemplete
    public Map getProjectTemplateByCode(String projectTempCode){
        return baseMapper.getProjectTemplateByCode(projectTempCode);
    }

}
