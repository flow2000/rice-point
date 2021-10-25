package com.ruoyi.canteen.domain;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * Treeselect树结构实体类
 *
 * @author panghai
 */
public class CanteenTreeSelect implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 节点ID */
    private Long id;

    /** 节点名称 */
    private String label;

    /** 子节点 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<CanteenTreeSelect> children;

    public CanteenTreeSelect()
    {

    }

    public CanteenTreeSelect(Canteen canteen)
    {
        this.id = canteen.getCanteenId();
        this.label = canteen.getCanteenName();
        this.children = canteen.getChildren().stream().map(CanteenTreeSelect::new).collect(Collectors.toList());
    }

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getLabel()
    {
        return label;
    }

    public void setLabel(String label)
    {
        this.label = label;
    }

    public List<CanteenTreeSelect> getChildren()
    {
        return children;
    }

    public void setChildren(List<CanteenTreeSelect> children)
    {
        this.children = children;
    }
}
