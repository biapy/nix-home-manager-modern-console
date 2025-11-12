{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modern-console.system-monitoring;
in
{
  options.modern-console.system-monitoring = {
    enable = mkEnableOption ''
      system monitoring and diagnostic tools.
      
      This module provides comprehensive system monitoring, process management,
      hardware diagnostics, and performance profiling tools. It includes modern
      replacements for classic tools like top/htop, as well as specialized
      utilities for detailed system analysis.
      
      **Key features:**
      - **Process Monitors:** btop, htop, gotop, glances (configured)
      - **System Info:** neofetch, fastfetch, inxi, screenfetch
      - **Hardware:** lm_sensors, acpi, nvtop (GPU), lsof, pciutils, usbutils
      - **Performance:** sysstat (sar, iostat), iotop, nethogs, dstat
      - **Debugging:** strace, ltrace, gdb for system call tracing
      - **Benchmarking:** sysbench, stress, stress-ng
      - **Health:** smartmontools for drive health monitoring
      - **USB:** cyme (modern lsusb replacement)
      
      Both btop and htop are pre-configured with optimal settings for
      tree view, color schemes, and sensible update intervals.
    '';
  };

  config = mkIf cfg.enable {
    # 📊 System Monitoring & Diagnostic Tools

    home.packages = with pkgs; [
      # 📊 btop - Resource monitor (modernized top/htop)
      # Homepage: https://github.com/aristocratos/btop
      btop

      # 🔌 cyme - List USB devices (modern lsusb)
      # Homepage: https://github.com/tuna-f1sh/cyme
      cyme

      # 💻 htop - Interactive process viewer
      # Homepage: https://htop.dev/
      htop

      # 🎨 glances - Cross-platform system monitoring tool
      # Homepage: https://nicolargo.github.io/glances/
      glances

      # 🌡️ nvtop - NVIDIA GPU process monitor
      # Homepage: https://github.com/Syllo/nvtop
      # Note: Only useful if you have NVIDIA GPU
      nvtop

      # 📈 gotop - Terminal based graphical activity monitor
      # Homepage: https://github.com/xxxserxxx/gotop
      gotop

      # 🔍 lsof - List open files
      # Homepage: https://github.com/lsof-org/lsof
      lsof

      # 🖥️ neofetch - System information tool
      # Homepage: https://github.com/dylanaraps/neofetch
      neofetch

      # 🎨 fastfetch - Neofetch-like system info tool (faster)
      # Homepage: https://github.com/fastfetch-cli/fastfetch
      fastfetch

      # 📊 inxi - Full system information script
      # Homepage: https://github.com/smxi/inxi
      inxi

      # 🔋 acpi - Battery and thermal information
      # Homepage: https://sourceforge.net/projects/acpiclient/
      acpi

      # 🌡️ lm_sensors - Hardware monitoring (temperature, voltage, fans)
      # Homepage: https://github.com/lm-sensors/lm-sensors
      lm_sensors

      # 📊 sysstat - Performance monitoring tools (sar, iostat, mpstat)
      # Homepage: https://github.com/sysstat/sysstat
      sysstat

      # 💾 iotop - I/O monitoring
      # Homepage: http://guichaz.free.fr/iotop/
      iotop

      # 🌐 nethogs - Network bandwidth by process
      # Homepage: https://github.com/raboof/nethogs
      nethogs

      # 📊 dstat - Versatile resource statistics tool
      # Homepage: http://dag.wiee.rs/home-made/dstat/
      dstat

      # 🔍 strace - System call tracer
      # Homepage: https://strace.io/
      strace

      # 🔧 ltrace - Library call tracer
      # Homepage: https://ltrace.org/
      ltrace

      # 🐛 gdb - GNU debugger
      # Homepage: https://www.gnu.org/software/gdb/
      gdb

      # 📊 sysbench - Scriptable database and system performance benchmark
      # Homepage: https://github.com/akopytov/sysbench
      sysbench

      # 💻 stress - Stress testing tool
      # Homepage: https://people.seas.harvard.edu/~apw/stress/
      stress

      # 🎯 stress-ng - Modernized stress tool
      # Homepage: https://github.com/ColinIanKing/stress-ng
      stress-ng

      # 🔍 pciutils - PCI utilities (lspci)
      # Homepage: https://mj.ucw.cz/sw/pciutils/
      pciutils

      # 🔌 usbutils - USB utilities (lsusb)
      # Homepage: http://www.linux-usb.org/
      usbutils

      # 💾 smartmontools - Hard drive health monitoring (smartctl)
      # Homepage: https://www.smartmontools.org/
      smartmontools

      # 🔍 dmidecode - DMI/SMBIOS table decoder
      # Homepage: https://www.nongnu.org/dmidecode/
      dmidecode

      # 📊 nmon - Performance monitoring tool
      # Homepage: http://nmon.sourceforge.net/
      nmon

      # 🖥️ screenfetch - System information with ASCII art
      # Homepage: https://github.com/KittyKatt/screenFetch
      screenfetch
    ];

    # Configure btop with better defaults
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "Default";
        theme_background = false;
        truecolor = true;
        rounded_corners = true;
        graph_symbol = "braille";
        shown_boxes = "cpu mem net proc";
        update_ms = 2000;
        proc_sorting = "cpu lazy";
        proc_tree = false;
        check_temp = true;
        cpu_graph_upper = "total";
        cpu_graph_lower = "total";
        cpu_single_graph = false;
        show_uptime = true;
        show_battery = true;
        vim_keys = false;
      };
    };

    # Configure htop
    programs.htop = {
      enable = true;
      settings = {
        tree_view = true;
        hide_kernel_threads = true;
        hide_userland_threads = false;
        shadow_other_users = false;
        show_thread_names = false;
        show_program_path = true;
        highlight_base_name = true;
        highlight_megabytes = true;
        highlight_threads = true;
        tree_view_always_by_pid = false;
        header_margin = true;
        detailed_cpu_time = false;
        cpu_count_from_one = true;
        update_process_names = false;
        account_guest_in_cpu_meter = false;
        color_scheme = 0;
        delay = 15;
        hide_function_bar = 0;
      };
    };
  };
}
