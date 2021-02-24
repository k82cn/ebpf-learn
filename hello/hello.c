#include "/home/ubuntu/workspace/src/ebpf-learn/vendor/github.com/iovisor/gobpf/elf/include/uapi/linux/bpf.h"
#include "/home/ubuntu/workspace/src/ebpf-learn/vendor/github.com/iovisor/gobpf/elf/include/bpf_map.h"

#define SEC(NAME) __attribute__((section(NAME), used))

SEC("tracepoint/syscalls/sys_enter_execve")

int bpf_prog(void *ctx) {
	char msg[] = "Hello BPF";
	bpf_trace_printk(msg, sizeof(msg));
	return 0;
}

char _license[] SEC("license") = "GPL";
