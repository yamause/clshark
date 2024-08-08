# clshark.sh🦈

ContainerLab のネットワークノードに対してリモートから Wireshark でパケットキャプチャをするためのスクリプト

## Use

```bash
./clshark.sh <login_user@containerlab_host_address> <lab_node_name> <if_name>
```

```bash
# Sample
./clshark.sh clab-server clab-ceos_2tier-node1-1 eth1
```

## Preparation

スクリプトに実行権限を付与してください。

```bash
chmod 755 clshark.sh
```

ログインユーザはパスワードなしで sudo 実行権限を有している必要があります。事前に ContainerLab をホストしているサーバでユーザに権限を与えてください。

```bash
sudo visudo

# Add 
<username> ALL=NOPASSWD: /usr/sbin/ip netns exec*
```

もしデフォルトのインストールパス以外に Wireshark をインストールしている場合は、環境変数 `WIRESAHRK_PATH` にインストールパスを設定してください。  
この変数が設定されている場合、デフォルトのインストールパスよりも優先して利用されます。

## Lisense

This project is licensed under the MIT License, see the LICENSE.txt file for details.
