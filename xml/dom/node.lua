local upperclass    = require(LIBXML_REQUIRE_PATH..'lib.upperclass')
local utils         = require(LIBXML_REQUIRE_PATH..'lib.utils')
local DOMNamedNodeMap  = require(LIBXML_REQUIRE_PATH..'dom.namednodemap')
local DOMNodeList      = require(LIBXML_REQUIRE_PATH..'dom.nodelist')

--
-- Define class
--
local Node = upperclass:define('DOMNode')

--
-- A NamedNodeMap containing the attributes of this node
--
property : attributes { 
    nil; 
    get='public'; 
    set='protected';
    type='table'
}

--
-- Returns the absolute base URI of a node
--
property : baseURI {
    "";
    get='public';
    set='protected'
}

--
-- Returns a NodeList of child nodes for a node
--
property : childNodes { 
    nil; 
    get='public'; 
    set='protected';
    type='table'
}

--
-- Returns the first child of a node
--
property : firstChild { 
    nil; 
    get='public'; 
    set='protected';
    type={DOMNode, DOMElement, }
}

--
-- Returns the last child of a node
--
property : lastChild { 
    nil; 
    get='public'; 
    set='protected';
    type='any'
}

--
-- Returns the local part of the name of a node
--
property : localName {
    "";
    get='public';
    set='protected'
}

--
-- Returns the namespace URI of a node
--
property : namespaceURI {
    "";
    get='public';
    set='protected';
}

--
-- Returns the node immediately following a node
--
property : nextSibling {
    nil;
    get='public';
    set='protected';
    type='any'
}

--
-- Returns the name of a node, depending on its type
--
property : nodeName { 
    nil; 
    get='public'; 
    set='protected';
    type='string';
}

--
-- Returns the type of a node
--
property : nodeType { 
    0; 
    get='public'; 
    set='protected';
}

--
-- Sets or returns the value of a node, depending on its type
--
property : nodeValue {
    nil;
    get='public';
    set='public';
    type='any'
}

--
-- Returns the root element (document object) for a node
--
property : ownerDocument {
    nil;
    get='public';
    set='protected';
    type='any'
}

--
-- Returns the parent node of a node
--
property : parentNode { 
    nil; 
    get='public'; 
    set='public';
    type='any'
}

--
-- Sets or returns the namespace prefix of a node
--
property : prefix {
    nil;
    get='public';
    set='public';
    type='any'
}

--
-- Returns the node immediately before a node
--
property : previousSibling {
    nil;
    get='public';
    set='protected';
    type='any';
}

--
-- Sets or returns the textual content of a node and its descendants
--
property : textContent {
    nil;
    get='public';
    set='public';
    type='any';
}

--
-- Class Construct
--
function private:__construct(NODETYPE) 
    if type(NODETYPE) == "number" then        
        self.nodeType = NODETYPE
    else
        error("NodeType must be a number")
    end
    
    self.attributes = DOMNamedNodeMap()
    self.childNodes = DOMNodeList()
end

--
-- Appends a new child node to the end of the list of children of a node
--
function public:appendChild(NODE)    
    NODE.parentNode = self
    
    NODE.ownerDocument = self.ownerDocument
    
    self.childNodes:add(NODE)
    
    self.firstChild = self.childNodes[1]
    
    self.lastChild = self.childNodes[self.childNodes.length]
    
    -- If this node is a document node (type 9) and the appending node is 
    -- a element node (type 1) then set documentElement to self
    if self.nodeType == 9 and NODE.nodeType == 1 then
        self.documentElement = NODE
    end
    
    return NODE
end

--
-- Clones a node
--
function public:cloneNode()
    error("Method Not Yet Implimented")
end

--
-- Compares the placement of two nodes in the DOM hierarchy (document)
--
function public:compareDocumentPosition()
    error("Method Not Yet Implimented")
end

--
-- Returns a DOM object which implements the specialized APIs of the specified feature and version
--
function public:getFeature()
    error("Method Not Yet Implimented")
end

--
-- Returns the object associated to a key on a this node. The object must first have been set to this node by calling setUserData with the same key
--
function public:getUserData()
    error("Method Not Yet Implimented")
end

--
-- Returns true if the specified node has any attributes, otherwise false
--
function public:hasAttributes()
    if self.attributes.length > 0 then
        return true
    else
        return false
    end    
end

--
-- Returns true if the specified node has any child nodes, otherwise false
--
function public:hasChildNodes()
    if self.childNodes.length > 0 then
        return true
    else
        return false
    end
end

--
-- Inserts a new child node before an existing child node
--
function public:insertBefore()
    error("Method Not Yet Implimented")
end

--
-- Returns whether the specified namespaceURI is the default
--
function public:isDefaultNamespace()
    error("Method Not Yet Implimented")
end

--
-- Tests whether two nodes are equal
--
function public:isEqualNode()
    error("Method Not Yet Implimented")
end

--
-- Tests whether the two nodes are the same node
--
function public:isSameNode()
    error("Method Not Yet Implimented")
end

--
-- Tests whether the DOM implementation supports a specific feature and that the feature is supported by the specified node
--
function public:isSupported()
    error("Method Not Yet Implimented")
end

--
-- Returns the namespace URI associated with a given prefix
--
function public:lookupNamespaceURI()
    error("Method Not Yet Implimented")
end

--
-- Returns the prefix associated with a given namespace URI
--
function public:lookupPrefix()
    error("Method Not Yet Implimented")
end

--
-- Puts all Text nodes underneath a node (including attribute nodes) into a "normal" form where only structure 
-- (e.g., elements, comments, processing instructions, CDATA sections, and entity references) separates Text nodes, 
-- i.e., there are neither adjacent Text nodes nor empty Text nodes
--
function public:normalize()
    error("Method Not Yet Implimented")
end

--
-- Removes a specified child node from the current node 
--
function public:removeChild()
    error("Method Not Yet Implimented")
end

--
-- Replaces a child node with a new node
--
function public:replaceChild()
    error("Method Not Yet Implimented")
end

--
-- Associates an object to a key on a node
--
function public:setUserData()
    error("Method Not Yet Implimented")
end

--
-- Returns the element that has an ID attribute with the given value. If no such element exists, it returns null
--
function public:getElementById(ID)
    error("Method Not Yet Implimented")
end

--
-- Returns a NodeList of all elements with a specified name
--
function public:getElementsByTagName(TAGNAME)
    local nodelist = DOMNodeList()
    local targetElement = self
    
    if targetElement.nodeType == 1 and targetElement.tagName == TAGNAME then
        nodelist:add(targetElement)
    end
    
    if targetElement:hasChildNodes() then        
        for a=1, targetElement.childNodes.length do
            local childNodes = targetElement.childNodes[a]:getElementsByTagName(TAGNAME)
            for b=1, childNodes.length do
                nodelist:add(childNodes[b])
            end
        end
    end

    return nodelist
end

--
-- Returns a NodeList of all elements with a specified name and namespace
--
function public:getElementsByTagNameNS()
    error("Method Not Yet Implimented")
end

--
-- Compile Class
--
return upperclass:compile(Node)