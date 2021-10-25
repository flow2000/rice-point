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

    /** 是否被禁用 1=禁用 0=正常(默认) */
    private boolean disabled = false;

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
        this.disabled = "1".equals(canteen.getStatus());
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

    public Boolean getDisabled()
    {
        return disabled;
    }

    public void setDisabled(Boolean status)
    {
        this.disabled = status;
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
