debug_print("opacity.lua")
debug_print(get_class_instance_name());
debug_print(get_window_xid());

function set_opacity(class_name, opacity)
    if (get_class_instance_name() == class_name) then
        os.execute("transset-df -i " .. get_window_xid() .. " " .. opacity);
    end
end

-- set_opacity("dropdown", "0.9")
-- set_opacity("ipython scratchpad", "0.9")
-- set_opacity("lyvi", "0.9")
-- set_opacity("ncmpcpp", "0.9")
-- set_opacity("python scratchpad", "0.9")
