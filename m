Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D97606A320
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Oct 2026 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ma6VBbww
Received: by smtp.kernel.org (Postfix)
	id 4E0351F01828; Mon, 26 Oct 2026 19:55:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793044531;
	b=0XIXvUmZSptPP8/vwA8A5M+Pcp60pvuKTIN7q+Cx8CmF30MarUCxD5y5yXg49mkzkLaj
	 VDzI58N8eu+gH1reAnJ+V+f1OJBwT3vnmyMRqZGXS68Vq3SHq5qVyK1k6Rzntg3DpvK2L
	 smAvNCIewzV9FUrbSI8HvaPQuLczlrOlTJtG6o8vGLiZGNdPy00JPWGgDDnUx/hsSLz5l
	 ogdJs4LUnUEB1LWuXDyXMW2d+7uec1VSMevqdLfuCtAb2ZtVBf3bsRngG51XLMk/t5zdi
	 +TqLiM6nkjHQVt8G+07lhViY7tG1dIEP/r1wbQvQHlVLQgm/dDyou2FBszENmaHUR2Q==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793044531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type;
	bh=KFWLY101kRHD9mssadgRRPoV47HkqjA/2NAH0ex4JXs=;
	b=nrUxps8B3MxXBWYYCRpzmXDe/pONCE4Kbp+j9SE7uIwe25jLDLshdc2gxKb6/EHTdOvp
	 DbwojvpQ26QNBkbqDAnqlMBaC29jwq8mh5EP9vw/JeG7u4DegDEow91tBsedJCU4BAUaC
	 xmSvGYsg+mFD8elVYImFTTiEO7j66c0vZZITYttUfc/iSqblFvQ/GbMbpdirBUgMHbeUa
	 /xpO5j9zz8SbB8eZT5RJQPqmoRCm3408Sw09TG32kkceD/q2PHDpKhg3eEm5DHcS3Y6k6
	 oO5wrZ1MogfFaCmUkWwLg7mH9bCWJR7D287kfQoS3s9DYCa+LAGB4CvOqgB38XDQRSw==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ma6VBbww;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B43701F01825
	for <linux-firmware@kernel.org>; Mon, 26 Oct 2026 19:55:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ma6VBbww
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B43701F01825
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9e53d011eso23773025ad.1
        for <linux-firmware@kernel.org>; Mon, 26 Oct 2026 12:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793044529; cv=none;
        d=google.com; s=arc-20260327;
        b=eOcxXKflUh2G4bzK5rl63oOk1D01LtujrjwKX8VyQb73bPUxD2HlBFxDjXzLnvktcu
         UleEfYtsGP5r5BxTv04jk+M82C/bdNuxcSEGeGfD96tnDy26lbjkfY3Pp9vCqaBAfXna
         RkTJhDjB1Q+bbLCikc0wYYx5Sqv8vPz2ravEmCVEf2QOsWl59VAn8kcZprlD3aqjHxKp
         gudkCD6xNSIFrE71zLOxaQKBFtYuFTNJOoNcB4Hrl/qN09qUBz2pqmI1s3i0TJSb7WCW
         HNkpmLX05thzCzKUtIZMO2BqIaht1EgFJnfhRl+P74YjewLJo22CwWkuNIGrzyo5BEzG
         CtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KFWLY101kRHD9mssadgRRPoV47HkqjA/2NAH0ex4JXs=;
        fh=KX8oQQsdwHZEDxIjK3rm0DF+tF80/skxmPBnrW0cwBA=;
        b=lEDQp4mUxPpELmQbN3XcXciR8vvk7SOxG43b2RqNThcfKNmIQY6MII5D1u/rCs7qam
         oUc1+Hegh5VnMs3Y01InNRs3kTe6ahK2xCdGfZ1G0phO59Dl/Ub88SW2IkYeCd9ilPlR
         JATyOAqqI0qBeV3XSl9ldSHXyzel05It9aYxL7U+jndZ05s5WzaKg2NzG/IJnF0/mzAj
         4Pilo70T1PfS7QcP6tDxUtpHcpBFD3pTLMjQ9jggTIR6lIlVA8JG+DzN+uDU5sYcfSVD
         fNfnwpC4q9S6V3Mig+gtMeQWQWiDQkLCRJud8Xj3q+gq3udA7/yeAN1pWU88A36n7oEv
         pSAw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044529; x=1793649329; darn=kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KFWLY101kRHD9mssadgRRPoV47HkqjA/2NAH0ex4JXs=;
        b=ma6VBbwwJcDY+qDt7ZBNXAl7DvfBhm68ABWGSSjgkBPVmiR/ZnEAVkdl2s9fIPAAjF
         Qv9YqB87G8hWbRJqo+NDLHuuMwAR+ugawe33aKMsFHn+crrxMhePeREt7Hhv+LxzjKCH
         M9LKYFvGrWHyGWygv/yZe1fn/tpRRbHdRj1EIo0m6ROE5fcaIj1e/kG7k+hvy8ZfcjQe
         NrgIfcbx8OFQmqkKBDnxL+KYf5F5BzwrYfYZlBbRLTU1EfQtfeSV2wmGtvgVKiyTBzrO
         bXeQkiKiW5YEF/O0QSiDiRfcgAzmyXyx+UDLGKjuQF4e/T/7QI8jJLVByE7zusfHsgY2
         Lolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044529; x=1793649329;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KFWLY101kRHD9mssadgRRPoV47HkqjA/2NAH0ex4JXs=;
        b=g6RETLDyYg3UeY5rDGP2sMVsHOBZJs/0Dn1Hj3GvyW/6+Q5VCPSJKG7EOgQb6Dr6f9
         yKxOVHgUgfIpriPvAP9hfh1mZTFr0sDqgFnGRLG0HPsgsrNyCQvGysWa54ErW2VAd5iM
         eymln0Qak30NaN1R6wXfHjjb99oTX7t21ibitQP/3LuH+ySjpl2oCMKf0f6+DjasCJI5
         W94Vwy1km0y78rc6rOnEBbTZQH9IScOn/O9aYwgz9KgC0EykieEYc15slMAJz8u1Ksgj
         qFsNvudySyyUu+d97jdrJYqAVyS36bQzIRUq5jm8y/VyezyfgiYh9b1/Vcrp4BCSfxjH
         bhxA==
X-Gm-Message-State: AFq9FYKry5WAK3m8MwTQ81yb15fCjg4e+PyUcqD28PKviaE0+d82ZMTl
	zu7axX1s0Xhku29APpzi0x9uPrCcUQRcKsbxYf40ICgDBk1UD4/Yym6J52vEwr4+vl7ZVctAwmc
	mtImicJjEtMG6vw4cQj6cJZOa7bQ2o3w=
X-Gm-Gg: AYBFou1xetI1LpaBREytMHf0oaAz2fCubEBRUXxP1syG7nxjS79L9y56s/JHQOduLQo
	jxaDr9yQldVWj2dbqOpBBYbBARsWrpzp49JQopvcAke+fuAoNKgSVTEf8ZLsj3IcgXgNilqIS9T
	1vT/di4H7uc60qjwF5G+orYNAFCnP25U2SRj3De5ZJ8xpto5WqV/GDZYflOMdBDWBjJ/Timsw5U
	aIm7WNbkph3CJlc01JnFydvEgh+m6kcL7566ubbsP12+J/q+vK1U2ilUaKCVEI5cMRsd9pBG9s1
	kj3SHkYhTvu3TEq0CXtcz2Q5R9AjnMR3+UA9LKxmB1D3MIv9eCD6MPZ+EA2Yr1B912k6m7PMWw3
	CgHQ24ZJpi+GDKjeDe7ITA4PjfjkdxGXZqspp7GmIP3cyHnGe7wGuS8La7SsQcLd3RSE1FSgfnH
	e0yujklRRyvbuf5ykjGxYLI0QDYkjRo+EctopmvdKml8x0lVVGoIGt4wQaCFt35UV/FuArfTfs4
	lubPT0NVRmz
X-Received: by 2002:a17:902:db0f:b0:2e8:4066:d247 with SMTP id
 d9443c01a7336-2ea9c697792mr70723705ad.33.1793044529481; Mon, 26 Oct 2026
 12:55:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Athos Andrade <athosandrade04@gmail.com>
Date: Mon, 26 Oct 2026 16:55:18 -0300
X-Gm-Features: AclHuK8hIyLF2cY2Je-JDB_x2NuD_QbnLgqmgjFyM3CEYmAXLDMd_z2lD3A7og8
Message-ID: <CAAErAfLhrvtQOEqtGhEOmNX+0Lkq7ckLekmgSjot4-7jFD0shA@mail.gmail.com>
Subject: [BUG] rtl_bt: RTL8852B BT USB FW 0x127C_FD78 stops delivering BLE
 keyboard input, 0x42D3_4E04 works
To: linux-bluetooth@vger.kernel.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hildawu@realtek.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Since linux-firmware commit 4ca3317e ("rtl_bt: Update RTL8852B BT USB
FW to 0x127C_FD78"), a BLE keyboard connected to the RTL8852BU
Bluetooth controller of my laptop stops delivering key presses every
1 to 4 minutes. Going back to the previous firmware only
(0x42D3_4E04, commit 8bcc91d1) fixes it. I did an A/B test and the
result is repeatable.

Hardware and software
---------------------
- Laptop: Lenovo ThinkPad E14 Gen 4 (21E4001GBO), Intel i5-1235U
- Controller: Realtek RTL8852BE combo card, Bluetooth on USB 0bda:4853
  (ROM: hci_ver=0b hci_rev=000b lmp_subver=8852)
- Firmware: rtl_bt/rtl8852bu_fw.bin
    bad:  0x127cfd78
    good: 0x42d34e04
  rtl8852bu_config.bin is the same in both cases
- Kernel: 7.2.8 (Arch-based distro kernel, linux-omarchy 7.2.8-9)
- linux-firmware-realtek 20260916 (Arch package)
- BlueZ 5.87
- Peripheral: Lofree Flow2-68 keyboard, BLE HID over GATT (HOGP)
- Other LE devices on the same controller: Logitech MX Master 3S,
  Logitech MX Ergo S

Symptom
-------
The keyboard stays connected but stops sending input. In btmon:

- The last ATT Handle Value Notification from the keyboard is a
  key-down report with no matching key-up report.
- After that, no more ACL data arrives from the keyboard handle.
- There is no Disconnect Complete event and no supervision timeout.
- Other LE connections on the same controller (the mouse) keep
  delivering data during the freeze.
- The keyboard does not advertise during the freeze.

The only way to recover is to reconnect the keyboard from the
keyboard side (Disconnect Complete, reason 0x13). The kernel logs
"Bluetooth: hci0: ACL packet for unknown connection handle" at each
reconnect.

The same keyboard works without problems with macOS, with Windows on
a different machine, and with a phone.

Connection parameters
---------------------
The keyboard sends an L2CAP Connection Parameter Update Request right
after connecting, and the host accepts it:

  interval 7.5 ms, peripheral latency 44, supervision timeout 1500 ms

Ruled out (all with 0x127C_FD78)
--------------------------------
- btusb autosuspend (power/control=on): still freezes
- reload of btusb (new firmware download): freezes after ~1 min
- Wi-Fi radio off (rfkill block wlan, wired network): freezes
  after ~4 min
- Num Lock LED off (no LED output report): still freezes
- new pairing on a different keyboard channel: still freezes

A/B test
--------
1. 0x127C_FD78 (package default): 3 freezes in 6 minutes.
2. 0x42D3_4E04 copied to /lib/firmware/updates/rtl_bt/, btusb
   reloaded: no freeze during normal use.
3. Override removed (back to 0x127C_FD78), btusb reloaded: freeze
   after about 1 minute.
4. Override restored (0x42D3_4E04): no freeze again.

I can capture btmon logs (btsnoop) of a freeze and test new firmware
builds if that helps.

Thanks,
Athos Andrade
