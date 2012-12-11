
<#if !embedded>
  <span id="ajax-base-url" style="display: none">${ajaxBaseUrl}</span>
  <span id="view-heatmap-segment" style="display: none">${viewHeatmapSegment}</span>
  <span id="fragment-segment" style="display: none">${fragmentSegment}</span>
</#if>

<span id="setId" style="display: none">${setId}</span>
<span id="baseId" style="display: none">${baseId}</span>
<span id="condensed" style="display: none">${condensed?string}</span>
<span id="witness-filter" style="display: none">${witnessFilter}</span>

<#if !condensed>
    <div id="files" class="files">
        <div class="header">Witness List</div>
        <#list witnesses as witness>
            <#if witness.id == baseId>
                <div class="base set-file" title="${witness.name}">
                  <div id="toggle-${witness.id}" class="visibility-toggle base-visibility"></div>${witness.name}
                     <span id="base-tag">[base]</span>
                  </div>
            <#else>
                <div class="set-witnesss set-file">
                    <div id="toggle-${witness.id}" class="visibility-toggle"></div>
                    <div id="witness-${witness.id}" class="witness" title="${witness.name}">${witness.name}</div>
                    <div id="change-index-${witness.id}" class="change-index"></div>
                    <div style="clear: both;"></div>
                </div>
            </#if>
        </#list>
    </div>
</#if>

<div class="heatmap-div <#if condensed>condensed</#if>">
    <div class="header">${baseName}</div>  
    
    <#if ( !condensed )>
        <#if (embedded && ( hasRevisions || hasNotes || hasBreaks)) || !embedded >
            <div class="heatmap-toolbar">
                <#if hasRevisions>
                    <a class="juxta-button" id="revisions-button" title="Toggle revision styling">Revisions</a>
                </#if>
                <#if hasNotes >
                    <a class="juxta-button" id="notes-button" title="Toggle notes visibiity">Notes</a>
                </#if>
                <#if hasBreaks>
                    <a class="juxta-button" id="pb-button" title="Toggle page break visibility">Page Breaks</a>
                </#if>
                <#if !embedded>
                    <a class="juxta-button" id="refresh-button" title="Refresh heatmap view">Refresh</a>
                </#if>
            </div> 
         </#if>
    </#if>
    
    <div id="heatmap-scroller" class="heatmap-scroller" >
        <@heatmapStreamer/> 
    </div>
    
    <#if condensed>
        <div id="condensed-heatmap-footer" class="footer">
            <a class="juxta-button condensed" id="condensed-list-button">Witness List</a>
            <a class="juxta-button condensed" id="full-size-link" title="View full-sized share in new browser window">View Full Size</a>
            <div style="clear: both"></div>
        </div>
        
        <!-- popup for selecting a new base witness -->
        <div id="pick-base-popup" class="witnesses-popup">
            <div class="header">Select Base Witness</div>
            <select id="witness-select" class="witness-select" size="${witnessCount}">
                <#list witnesses as witness> 
                    <option id="${witness.id}" class="witness-option">${witness.name}</option>
                </#list>
            </select>
            <div class="popup-buttons" style="text-align: right">
                <a id="base-cancel-button" class="juxta-button" >Cancel</a>
                <a id="base-ok-button" class="juxta-button" >OK</a>
            </div>
        </div>
    </#if>
        
</div>

<div style="clear: both;"></div>

