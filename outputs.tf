output "external_ip" {
 value = "${yandex_compute_instance.vm-1[*].network_interface[0].nat_ip_address}"
}

output "instance_id" {
    value = "${yandex_compute_instance.vm-1[*].name}"
}

output "instance_info" {
    value = "${yandex_compute_instance.vm-1[*]}"
}

output "ansible_host" {
    value = formatlist(
        "%v ansible_ssh_host=%v",
            split(",","${join(",",yandex_compute_instance.vm-1[*].name)}"),
            split(",","${join(",",yandex_compute_instance.vm-1[*].network_interface[0].nat_ip_address)}")
        )
}
