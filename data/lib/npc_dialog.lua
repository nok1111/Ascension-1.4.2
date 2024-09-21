local OpcodeDialog = 80
local Actions = {
  open = 1,
  closed = 2
}

function doSendDialogNpc(cid, npc, msg, opc)
  if ( not opc ) then
    opc = ''
  end
  Player(cid):sendExtendedOpcode(OpcodeDialog, table.serialize({ action = Actions.open, data = { npcId = npc, message = msg, options = opc } })) 
end

function doSendDialogNpcClose(cid)
   Player(cid):sendExtendedOpcode(OpcodeDialog, table.serialize({ action = Actions.closed }))
end