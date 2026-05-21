#!/bin/bash
ansible -i inventory.yml all -m ping
