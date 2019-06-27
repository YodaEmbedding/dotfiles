debug_print(get_class_instance_name());
debug_print(get_window_xid());

if (get_class_instance_name() == "dropdown") then
    os.execute("transset-df -i " .. get_window_xid() .. " 0.9");
end
