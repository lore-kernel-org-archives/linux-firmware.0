Return-Path: <SRS0=KClX=G6=gmail.com=hekatombe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DAAC79F99
	for <linux-firmware@archiver.kernel.org>; Sun,  6 Sep 2026 13:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9E041F00A3D; Sun,  6 Sep 2026 13:18:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788700699;
	b=uX4Gei9Yr5j+xRiJ3K/rK7KUfNayP5eU71s9xCKiatZtVzGgSK3Iq6GZlMKvvbX1rQQP
	 9ILs1kODyCfp/zNwfCrWn9sYisoPdFGfxZbVkSUW6QJjCCbTiU+SYKdbqARWE77GORRoh
	 hCpo637CCTssUrYllu8soUL6hQ1u5JjaRUnNHlKtZ2yk8NUIBsl4vAkouA977PA80zfeP
	 ZCF8qdwU4/NTv2qDVOuILsjJdoOUURf5JDkHLEwK1e6QjUt5EaA4yaX3yzOLmUBBk3ldz
	 PUFCOK1M9iNhJ1oTtxLZMuYusPdNLtZCC/IxmJL95AIC1rt48Nk75PqhS2YGenDhM5w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788700699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:List-Id:To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LCgsSFac5vQn4+dnGIjTk14y+iqI6t+n2nm8q87at8Q=;
	b=nJ+GnlxnpRytGlbsxON7B2Puc3wqBm6+3cyUX835Du4gWNOxno9d/vxawL2O/3uT0/pw
	 Z4KhPifo4PRUlgiEsCIjqdGo/2dj+uIwSmtWdZzG7dzshePUQ4rkMykZlspLeYPTWN/6/
	 ubP4Dh0Wswy7iKW2eb11z9L96yrnpmCsAg247/gEnDfBRl1wEjbswP80PxapvTGUOyR4X
	 KOUVeIwHHJJEMfcJSzCHr7/lIDS8wMXeMrGmuNAvfx6VEDph7iiE5UY0koQLI7iouPTEr
	 3k9hNWSr/XEP3SI8Rr0Hq2uUKvqgl/4qGaPkwlzVfOOL5TGeubEk2tWkjUpRmHbvItg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZoSmvu7X;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 361DA1F00A3A
	for <linux-firmware@kernel.org>; Sun,  6 Sep 2026 13:18:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZoSmvu7X
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 361DA1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4ab4b4179so2159105e87.0
        for <linux-firmware@kernel.org>; Sun, 06 Sep 2026 06:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788700697; cv=none;
        d=google.com; s=arc-20260327;
        b=p8+VCvntpKTjN7HfcY4DRc78dHJLZTkefC3WkTlzo6cNf8qyD+A5EvG4rvrJL6bb+I
         H21bgcNxt7KUyidJHhOuUD9zn8N9x6l+WjyScQ5hnsux79GppXm3ZQgWoMic1kHaLvKl
         bT1l4yH8V3hl1u9WMMpQHCHOFgieWRp0XkZOzPHgJOAUcOuj/iycF+0iP3mMF7si9SiX
         D4MWT7mjy5uhepIrbICy9+HkcsyxM0Lq6ryw4nlQ+4EndHoFYBmkZnZ7WO4Fgy5KAurB
         o2lfmSKWqYPFO2Y8QG+hFZN1UP0KZHhSXyIEcAA0audxQfmi0KRJcbZgq1kCHf8I/TjZ
         B+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=LCgsSFac5vQn4+dnGIjTk14y+iqI6t+n2nm8q87at8Q=;
        fh=thzlYDAT27MWbzz3if4rQyeooyybPz7D/zeQezHlJZA=;
        b=IOI6ejcBtdpEhP/hlH3TBsQAWtAHI9asUNuXi0a+3TCbot8uK1HiNVMQL1tPbu3woL
         Zw/qG2ANjK0T30M0DjZunabjjHSkwLMYu1fxzv7SyYl0zXV5uPrFJ1lcSyjWdsyzN4Nv
         Ge0Iybix7KXmGTkbKyXYcjxB/7nJnNFdWS6/1/ON5fVYEvxPwtEK+zYsKXgaVIGwcAZh
         xEaJgyvqqU8ZaDPPNInBKKRRv0ctkVsiG25ZM5wfm3fabX4tUUioYlmms0DAASkS142p
         elhBT95xmbNmP/N8gPfv2cHtFdm3e2csSfTAqMu3Gqw86Mc6HxDWzeXLtST3au4e7RHg
         3yHQ==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788700697; x=1789305497; darn=kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCgsSFac5vQn4+dnGIjTk14y+iqI6t+n2nm8q87at8Q=;
        b=ZoSmvu7Xye0fr5m68Z9OFsU1ennPv7r2wGaculMGY1sVIDnIyy4bY24ic3OU5bV9Yh
         AnsOljBwZSBKGwX1uJb0NFUt7wekhe+/HqceNqD3rfCbJL8AlZKZCx9//+o8kazPVanG
         QT0iJhRqGobVmCY17vKFC8N3sSKRBoeYUmOq3+QM4O93eGGqDG1m+xPU6C74xBZ4Gq4B
         0Q6HZKbRvB8KeZGuKHbxq1roxMORpeL1s/fVqI93adhPUTa4UlzgVEc6kIvIcXG/LrCj
         Bjo4EgXldEOE1B6taS1qL7uRWe/7ttA93GcRGahFMqZWmMaFyKBbM/znfxN/LUZSYpb8
         J7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788700697; x=1789305497;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LCgsSFac5vQn4+dnGIjTk14y+iqI6t+n2nm8q87at8Q=;
        b=MSQWn6LoltU6VKyhRL5dAOvpTDoU7Gwi+lvA5z19I0PLSQIssFfQTgsONwJ7kxARzN
         RwyaXv16IhiQ+rk0RtdfnAZ1rQbINoUnGZngF1YtTH470W7bwV8TLlC010N6zN6KXGTp
         XaMIGE5XkgNKf200FoFWiWKsrAtfrpJ5I5Eju3GyxDfleFtVf03t3wP9UoAvM4A+eVZB
         NE9cOG0JENWkUyMTbZ1TXBEHF16BbOv+P0ZQL/ghzmOc9u0MmnXZRSIxpgrBxsf8+GLb
         5s4GFhyyCwVue/8RxrCccwxx6JuadLztoLxpoIOLQGRaGC7T14DeOS981eopQc9CbqTM
         rbwQ==
X-Gm-Message-State: AFuF++nLKoo6F7IopwZ+0PyWaMyBL0L+nENBgk/yk2dKWyAGgbpN8GIS
	urhdYz0P2S9lhG5oh4i1zWye79beUUJSK13qxHXG3kddHDTa2HaXB+jMYbnMLg2zUFBiHDeKKtD
	37pu3tao81ZPo9uhAnGKMp6qXEuMGJi/Oq+Xls/g=
X-Gm-Gg: AYBFou1Y+CUXOFSirrGIwWoif6ncKnpDj5YsH2okcH6jPyr7aI5/jlKzzWWhnzymilj
	Cu0KJrJLgP6iF051p1RJVxyWS9ad9aS4LUH8Yx040OWU6bmMr3PfTbLfs4RKS5Xf485FqnRhL3T
	8ATOp+K1ReqJxGqJwdcMV9tvrdOSjl31GJD30F9Oi0xEJNafB1ZsNgM66nOrNzgCj5L4kxNH8nB
	FtriNVArOHvtiIYRRhhNZ1JkXv/IweACdRMZV8gcpW+t1nLLIJQ0YxWNAGiQwU9iKAECVMiZe5f
	qqBvHcpjJMiKZPvGKUl/mbxNaTNys5BtMxwtMPTcMLvPOO9r4ARlu9gMNN5VJsqHTkwYmSP/iFw
	l9sY=
X-Received: by 2002:a05:6512:3ca5:b0:5b4:9838:4369 with SMTP id
 2adb3069b0e04-5b616f3280bmr5184538e87.16.1788700697031; Sun, 06 Sep 2026
 06:18:17 -0700 (PDT)
MIME-Version: 1.0
From: Troels Vognbjerg <hekatombe@gmail.com>
Date: Sun, 6 Sep 2026 15:18:05 +0200
X-Gm-Features: AcwNN1X2kE4jLOWLBGUhil_PDABfmBJBeSuYhkx9HiENA7WyTutxfFVoF9KX5vc
Message-ID: <CAPMyOuCk7SEhPvcNNQ3ZMUf=uH=e3Pp0NHf6zLoakrSvL4qEoA@mail.gmail.com>
Subject: ath12k: QCC2072 missing board data for ASUS UX3407NA and UX3607OA
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

I have been working on getting the Wifi working on a pair of Asus
UX3407NA and UX3607OA laptops.
Both came with QCC2072 WLAN cards.
The current linux-firmware (2026-08-10)
"ath12k/QCC2072/hw1.0/board-2.bin" does not contain board names for
these devices:
PCI vendor/device:       17cb:1112
subsystem vendor/device: 105b:e14f
qmi-chip-id:             33
qmi-board-id:            255

The current firmware will work with both laptops if I add the
following two lines to ath12k/QCC2072/hw1.0/board-2.bin:
bus=3Dpci,vendor=3D17cb,device=3D1112,subsystem-vendor=3D105b,subsystem-dev=
ice=3De14f,qmi-chip-id=3D33,qmi-board-id=3D255,variant=3DUX3407Q
bus=3Dpci,vendor=3D17cb,device=3D1112,subsystem-vendor=3D105b,subsystem-dev=
ice=3De14f,qmi-chip-id=3D33,qmi-board-id=3D255

Relevant dmesg from the UX3407NA laptop before the modification:
[    4.435741] ath12k_wifi7_pci 0004:01:00.0: BAR 0 [mem
0x78400000-0x785fffff 64bit]: assigned
[    4.435805] ath12k_wifi7_pci 0004:01:00.0: enabling device (0000 -> 0002=
)
[    4.435838] ath12k_wifi7_pci 0004:01:00.0: Wi-Fi 7 Hardware name:
qcc2072 hw1.0
[    4.439197] ath12k_wifi7_pci 0004:01:00.0: MSI vectors: 16
[    4.994025] ath12k_wifi7_pci 0004:01:00.0: chip_id 0x21 chip_family
0x4 board_id 0xff soc_id 0x40292100
[    4.994038] ath12k_wifi7_pci 0004:01:00.0: fw_version 0x100581de
fw_build_timestamp 2024-09-11 23:52 fw_build_id
QC_IMAGE_VERSION_STRING=3DWLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
[    5.001274] ath12k_wifi7_pci 0004:01:00.0: failed to fetch board
data for bus=3Dpci,vendor=3D17cb,device=3D1112,subsystem-vendor=3D105b,subs=
ystem-device=3De14f,qmi-chip-id=3D33,qmi-board-id=3D255,variant=3DUX3407Q
from ath12k/QCC2072/hw1.0/board-2.bin
[    5.001281] ath12k_wifi7_pci 0004:01:00.0: failed to fetch board
data for bus=3Dpci,vendor=3D17cb,device=3D1112,subsystem-vendor=3D105b,subs=
ystem-device=3De14f,qmi-chip-id=3D33,qmi-board-id=3D255
from ath12k/QCC2072/hw1.0/board-2.bin
[    5.001285] ath12k_wifi7_pci 0004:01:00.0: failed to fetch
board.bin from QCC2072/hw1.0
[    5.001288] ath12k_wifi7_pci 0004:01:00.0: qmi failed to load bdf:
[    5.001290] ath12k_wifi7_pci 0004:01:00.0: qmi failed to load board
data file:-2

And after:
[    4.439356] ath12k_wifi7_pci 0004:01:00.0: BAR 0 [mem
0x78400000-0x785fffff 64bit]: assigned
[    4.439682] ath12k_wifi7_pci 0004:01:00.0: enabling device (0000 -> 0002=
)
[    4.440005] ath12k_wifi7_pci 0004:01:00.0: Wi-Fi 7 Hardware name:
qcc2072 hw1.0
[    4.440870] ath12k_wifi7_pci 0004:01:00.0: MSI vectors: 16
[    4.993062] ath12k_wifi7_pci 0004:01:00.0: chip_id 0x21 chip_family
0x4 board_id 0xff soc_id 0x40292100
[    4.993066] ath12k_wifi7_pci 0004:01:00.0: fw_version 0x100581de
fw_build_timestamp 2024-09-11 23:52 fw_build_id
QC_IMAGE_VERSION_STRING=3DWLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

The modified board file:
$ ath12k-bdencoder  --info board-2.bin
FileSize: 401480
FileCRC32: 6b132b00
FileMD5: 1d137f4ea06c32f3597fe9e1d9f0511e
BoardNames[0]: 'bus=3Dpci,vendor=3D17cb,device=3D1112,subsystem-vendor=3D17=
cb,subsystem-device=3D1110,qmi-chip-id=3D33,qmi-board-id=3D24','bus=3Dpci,v=
endor=3D17cb,device=3D1112,subsystem-vendor=3D105b,subsystem-device=3De15a,=
qmi-chip-id=3D33,qmi-board-id=3D24','bus=3Dpci,vendor=3D17cb,device=3D1112,=
subsystem-vendor=3D105b,subsystem-device=3De14f,qmi-chip-id=3D33,qmi-board-=
id=3D255,variant=3DUX3407Q','bus=3Dpci,vendor=3D17cb,device=3D1112,subsyste=
m-vendor=3D105b,subsystem-device=3De14f,qmi-chip-id=3D33,qmi-board-id=3D255=
'
BoardLength[0]: 125452
BoardCRC32[0]: d922b5f6
BoardMD5[0]: d0b4209b75e695b5752e5289630cb3f0
BoardNames[1]: 'bus=3Dpci,vendor=3D17cb,device=3D1112,subsystem-vendor=3D17=
cb,subsystem-device=3D1110,qmi-chip-id=3D33,qmi-board-id=3D19'
BoardLength[1]: 125452
BoardCRC32[1]: 7eab4392
BoardMD5[1]: 01957cbb3d541f58e743537b852f0c7a
BoardNames[2]: 'bus=3Dpci,vendor=3D17cb,device=3D1112,subsystem-vendor=3D17=
cb,subsystem-device=3D1110,qmi-chip-id=3D33,qmi-board-id=3D12'
BoardLength[2]: 125452
BoardCRC32[2]: 11faa8d7
BoardMD5[2]: f795b5ab69acb96dddacdf75083e07b0
RegdbNames[0]: 'bus=3Dpci'
RegdbLength[0]: 24310
RegdbCRC32[0]: 891b8f74
RegdbMD5[0]: bf34dcd8532537769c28cb484b3568c6
--
Regards,
Troels Vognbjerg
