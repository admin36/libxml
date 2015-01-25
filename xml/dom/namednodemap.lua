local upperclass    = require(LIBXML_REQUIRE_PATH..'lib.upperclass')
local utils         = require(LIBXML_REQUIRE_PATH..'lib.utils')
local DOMNodeList   = require(LIBXML_REQUIRE_PATH..'dom.nodelist')

--
-- Define class
--
local NamedNodeMap = upperclass:define("DOMNamedNodeMap", DOMNodeList)

--
-- Returns the node with the specific name
--
function public:getNamedItem(NAME)
    for a=1, self.length do
        if self.nodes[a].nodeName == NAME then
            return self.nodes[a]
        end
    end
end

--
-- Returns the node with the specific name and namespace
--
function public:getNamedItemNS(NS, NAME)
    error("Method Not Yet Implimented")
end

--
-- Removes the node with the specific name
--
function public:removeNamedItem(NAME)
    local node = nil
    local nodeindex = nil
    for a=1, self.length do
        if self.nodes[a].nodeName == NAME then
            node = self.nodes[a]
            nodeindex = a
        end
    end
    table.remove(self.nodes, nodeindex)
end

--
-- Removes the node with the specific name and namespace
--
function public:removeNamedItemNS(NS, NAME)
    error("Method Not Yet Implimented")
end

--
-- Sets the specified node (by name)
--
function public:setNamedItem(ATTR_NODE)
    for a=1, self.length do
        if self.nodes[a].nodeName == ATTR_NODE.nodeName then
            local returnnode = self.nodes[a]
            self.nodes[a] = ATTR_NODE
            return returnnode
        end
    end
    
    table.insert(self.nodes, ATTR_NODE)
end

--
-- Sets the specified node (by name and namespace)
--
function public:setNamedItemNS(NS, NAME, NODE)
    error("Method Not Yet Implimented")
end

--
-- Compile class
--
return upperclass:compile(NamedNodeMap)



