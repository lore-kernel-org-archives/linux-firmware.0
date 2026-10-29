Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46226606A31F
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Oct 2026 08:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=zappa.cx header.i=@zappa.cx header.a=rsa-sha256 header.s=default header.b=YQxufcpC
Received: by smtp.kernel.org (Postfix)
	id 3FA4F1F031E1; Thu, 29 Oct 2026 08:42:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=213.136.63.253
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793263354;
	b=AaDr6S3bY89QQhDtu+cyAvxjA2bWzv3PMjwXM4+uZ/TG6EtHiuFwzWgstbnDgpnv5ooo
	 icDda4zBgu0FI/JFUfXOvjnNGzlS4/pTam+q+3p0Dwjv8A7AeT2iQdYRgl9O3p8tz9L4Q
	 NGoa/m0ASUw9lFIMBNHRHW3+5hlM3Y0FnVIxVjydnR60aezZZMdfdtRJoiWJ+B9Kb3YUN
	 ICm764Qc2NIQhk70wLqoNdofwEkBfxNblVo931LV2FJ606S7/6V4oyNKF9zZMIZL+Vq/y
	 oOnAfF/x3rCJSwnLTqJRqaSITKjyK0ZJm+kzaBCfzH11WyGTx/56wpPGvvhc8jbNAtw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793263354;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:List-Id:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:X-Greylist:X-Scanned-By;
	bh=6YX1vJfoXhPSDym5L9joNW5GBA6VUthp6Q6rn19CeRk=;
	b=J5Nr6kdovT8mUOQHtQh2a8LUxNvOTLB7G1XgTii2NQ9njIFDhMNRWBOmNH/eWVptDMkG
	 lxdNc9yPqz/+O1ciQh7jcmjr7nO1OOQyMcsQ0tMjFDoYEXwuT8eLdSq6YdbR93CNIUtee
	 h58QERI7ni96GdEA4qmmUM5UokPPPPW4fCkTPOZd0u7D2s+xvu+Fpw7DuEEkZveMCgXma
	 Cto+EZucwZYpKxHj0iYktNgO9ZjBeDlPu3LVcJwSTpp6gfp/VmpD+yc3zED+ZewLmc2xx
	 OKyIkAmAfZyJ1K0J1ycka+Twzh8qcQmW92ddqJ72hIFyQOJRiRtmodgO2u2qLAqchNg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=fail reason="signature verification failed" header.d=zappa.cx header.i=@zappa.cx header.a=rsa-sha256 header.s=default header.b=YQxufcpC;
	dmarc=none header.from=zappa.cx;
	spf=pass smtp.mailfrom=zappa.cx;
	arc=none smtp.remote-ip=213.136.63.253
Received: from alva.zappa.cx (alva.zappa.cx [213.136.63.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B03771F01829
	for <linux-firmware@kernel.org>; Thu, 29 Oct 2026 08:42:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=zappa.cx header.i=@zappa.cx header.a=rsa-sha256 header.s=default header.b=YQxufcpC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B03771F01829
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=zappa.cx
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=zappa.cx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=zappa.cx;
	s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6YX1vJfoXhPSDym5L9joNW5GBA6VUthp6Q6rn19CeRk=; b=YQxufcpCGLAzksA8lppPa2uXyj
	zi0v7oZZD+AHP3jf2VibVXD+gVyRecLpI0dc7wJzbkMR7EDHt2FgZZ8g7paka7bts1I7dEOzoMtjM
	30bf3XTcWea130mFdXb6ZW+92ys4+RnDL+k84n1Bl9/NUbl+BWCIeFGsFyxv5OE+DLyg=;
Received: from h-79-136-20-16.a465.priv.bahnhof.se ([79.136.20.16] helo=matrix.zappa.cx)
	by alva.zappa.cx with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sunkan+bugs.linux-firmware@zappa.cx>)
	id 1xMLiK-001a9Z-0X
	for linux-firmware@kernel.org;
	Thu, 29 Oct 2026 09:42:24 +0100
Received: from [172.17.18.129] (h-213-136-63-242.A137.corp.bahnhof.se [213.136.63.242])
	(authenticated bits=0)
	by matrix.zappa.cx (8.17.1.9/8.17.1.9/Debian-2+deb12u2) with ESMTPSA id 69T8gMQV307127
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 29 Oct 2026 09:42:23 +0100
Message-ID: <45509f42-2106-4468-83bc-90f67182bc78@zappa.cx>
Date: Thu, 29 Oct 2026 09:42:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: sv-SE
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Andreas Sundstrom <sunkan+bugs.linux-firmware@zappa.cx>
Subject: Intermittent bluetooth connetion BE200
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (matrix.zappa.cx [192.168.20.100]); Thu, 29 Oct 2026 09:42:23 +0100 (CET)
X-Scanned-By: MIMEDefang 3.3 on 192.168.20.100
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Starting with commit d4070db5 intel/ibt-0093-0291.sfi results in 
intermittent Bluetooth connection failures. Commit a17cf7dc works correctly.
Bluetooth device is: (USB 8087:0036 - Intel Corp. BE200 Bluetooth)
Bluetooth keyboard: Glove80

Kernel reports follow, I have included two working ones and last is the 
one that is not working.
I include two working logs because it seems that `FW download error 
recovery failed (-19)` can happen and it still works fine for me.

Note that on my device (Debian Trixie with kernel/firmware from the 
backports repository) ibt-0291-0291.sfi is symlinked to ibt-0093-0291.sfi:
# ls -l /lib/firmware/intel/ibt-0291-0291.sfi
lrwxrwxrwx 1 root root 17 okt 17 16:22 
/lib/firmware/intel/ibt-0291-0291.sfi -> ibt-0093-0291.sfi

There are also some user-mode errors logged by bluetoothd that I can 
provide in case that would help.


- Works fine #1
# LANG=C journalctl --no-hostname --dmesg --grep '(hci0|bluetooth)' -b 
120e97a1228d4e5b99a206797275b4e8
Sep 14 07:26:01 kernel: Bluetooth: Core ver 2.22
Sep 14 07:26:01 kernel: NET: Registered PF_BLUETOOTH protocol family
Sep 14 07:26:01 kernel: Bluetooth: HCI device and connection manager 
initialized
Sep 14 07:26:01 kernel: Bluetooth: HCI socket layer initialized
Sep 14 07:26:01 kernel: Bluetooth: L2CAP socket layer initialized
Sep 14 07:26:01 kernel: Bluetooth: SCO socket layer initialized
Sep 14 07:26:01 kernel: Bluetooth: hci0: Firmware timestamp 2026.18 
buildtype 1 build 112962
Sep 14 07:26:01 kernel: Bluetooth: hci0: Firmware SHA1: 0x38841b2b
Sep 14 07:26:01 kernel: Bluetooth: hci0: DSM reset method type: 0x01
Sep 14 07:26:01 kernel: Bluetooth: hci0: Found device firmware: 
intel/ibt-0291-0291.sfi
Sep 14 07:26:01 kernel: Bluetooth: hci0: Boot Address: 0x100800
Sep 14 07:26:01 kernel: Bluetooth: hci0: Firmware Version: 176-26.26
Sep 14 07:26:01 kernel: Bluetooth: hci0: FW download error recovery 
failed (-19)
Sep 14 07:26:02 kernel: Bluetooth: hci0: Device revision is 0
Sep 14 07:26:02 kernel: Bluetooth: hci0: Secure boot is enabled
Sep 14 07:26:02 kernel: Bluetooth: hci0: OTP lock is disabled
Sep 14 07:26:02 kernel: Bluetooth: hci0: API lock is enabled
Sep 14 07:26:02 kernel: Bluetooth: hci0: Debug lock is disabled
Sep 14 07:26:02 kernel: Bluetooth: hci0: Minimum firmware build 1 week 
10 2014
Sep 14 07:26:02 kernel: Bluetooth: hci0: Bootloader timestamp 2022.18 
buildtype 1 build 16362
Sep 14 07:26:02 kernel: Bluetooth: hci0: DSM reset method type: 0x01
Sep 14 07:26:02 kernel: Bluetooth: hci0: Found device firmware: 
intel/ibt-0291-0291.sfi
Sep 14 07:26:02 kernel: Bluetooth: hci0: Boot Address: 0x100800
Sep 14 07:26:02 kernel: Bluetooth: hci0: Firmware Version: 176-26.26
Sep 14 07:26:04 kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Sep 14 07:26:04 kernel: Bluetooth: BNEP filters: protocol multicast
Sep 14 07:26:04 kernel: Bluetooth: BNEP socket layer initialized
Sep 14 07:26:05 kernel: Bluetooth: hci0: Waiting for firmware download 
to complete
Sep 14 07:26:05 kernel: Bluetooth: hci0: Firmware loaded in 2981458 usecs
Sep 14 07:26:05 kernel: Bluetooth: hci0: Waiting for device to boot
Sep 14 07:26:05 kernel: Bluetooth: hci0: Device booted in 52827 usecs
Sep 14 07:26:05 kernel: Bluetooth: hci0: dsbr: enable: 0x01 value: 0x0b
Sep 14 07:26:05 kernel: Bluetooth: hci0: Found Intel DDC parameters: 
intel/ibt-0291-0291.ddc
Sep 14 07:26:05 kernel: Bluetooth: hci0: Applying Intel DDC parameters 
completed
Sep 14 07:26:05 kernel: Bluetooth: hci0: Firmware timestamp 2026.26 
buildtype 1 build 117936
Sep 14 07:26:05 kernel: Bluetooth: hci0: Firmware SHA1: 0xfa98b015
Sep 14 07:26:05 kernel: Bluetooth: hci0: Fseq status: Success (0x00)
Sep 14 07:26:05 kernel: Bluetooth: hci0: Fseq executed: 00.00.04.202
Sep 14 07:26:05 kernel: Bluetooth: hci0: Fseq BT Top: 00.00.04.202
Sep 14 07:26:05 kernel: Bluetooth: MGMT ver 1.23
Sep 14 07:26:05 kernel: Bluetooth: RFCOMM TTY layer initialized
Sep 14 07:26:05 kernel: Bluetooth: RFCOMM socket layer initialized
Sep 14 07:26:05 kernel: Bluetooth: RFCOMM ver 1.11
Sep 14 07:26:08 kernel: hid-generic 0005:16C0:27DB.0006: input,hidraw5: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Sep 15 07:20:47 kernel: hid-generic 0005:16C0:27DB.0008: input,hidraw5: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Sep 17 07:06:24 kernel: hid-generic 0005:16C0:27DB.0009: input,hidraw5: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Sep 18 07:13:16 kernel: hid-generic 0005:16C0:27DB.000A: input,hidraw5: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Sep 21 07:31:01 kernel: hid-generic 0005:16C0:27DB.000B: input,hidraw5: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Sep 22 06:55:05 kernel: hid-generic 0005:16C0:27DB.000C: input,hidraw5: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Sep 24 07:18:52 kernel: hid-generic 0005:16C0:27DB.000D: input,hidraw5: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Sep 24 07:20:00 kernel: hid-generic 0005:16C0:27DB.000E: input,hidraw5: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Sep 25 07:08:45 kernel: hid-generic 0005:16C0:27DB.000F: input,hidraw5: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Sep 28 07:29:40 kernel: hid-generic 0005:16C0:27DB.0010: input,hidraw5: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Sep 29 07:15:11 kernel: hid-generic 0005:16C0:27DB.0011: input,hidraw2: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a


- Works fine #2
# LANG=C journalctl --no-hostname --dmesg --grep '(hci0|bluetooth)' -b 
fb6b4ce463d6478ab85eb94ff86ce09e
Oct 06 07:18:06 kernel: Bluetooth: Core ver 2.22
Oct 06 07:18:06 kernel: NET: Registered PF_BLUETOOTH protocol family
Oct 06 07:18:06 kernel: Bluetooth: HCI device and connection manager 
initialized
Oct 06 07:18:06 kernel: Bluetooth: HCI socket layer initialized
Oct 06 07:18:06 kernel: Bluetooth: L2CAP socket layer initialized
Oct 06 07:18:06 kernel: Bluetooth: SCO socket layer initialized
Oct 06 07:18:06 kernel: Bluetooth: hci0: Firmware timestamp 2026.26 
buildtype 1 build 117936
Oct 06 07:18:06 kernel: Bluetooth: hci0: Firmware SHA1: 0xfa98b015
Oct 06 07:18:06 kernel: Bluetooth: hci0: DSM reset method type: 0x01
Oct 06 07:18:06 kernel: Bluetooth: hci0: Found device firmware: 
intel/ibt-0291-0291.sfi
Oct 06 07:18:06 kernel: Bluetooth: hci0: Boot Address: 0x100800
Oct 06 07:18:06 kernel: Bluetooth: hci0: Firmware Version: 176-26.26
Oct 06 07:18:06 kernel: Bluetooth: hci0: Firmware already loaded
Oct 06 07:18:06 kernel: Bluetooth: hci0: Fseq status: Success (0x00)
Oct 06 07:18:06 kernel: Bluetooth: hci0: Fseq executed: 00.00.04.202
Oct 06 07:18:06 kernel: Bluetooth: hci0: Fseq BT Top: 00.00.04.202
Oct 06 07:18:13 kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Oct 06 07:18:13 kernel: Bluetooth: BNEP filters: protocol multicast
Oct 06 07:18:13 kernel: Bluetooth: BNEP socket layer initialized
Oct 06 07:18:13 kernel: Bluetooth: MGMT ver 1.23
Oct 06 07:18:13 kernel: Bluetooth: RFCOMM TTY layer initialized
Oct 06 07:18:13 kernel: Bluetooth: RFCOMM socket layer initialized
Oct 06 07:18:13 kernel: Bluetooth: RFCOMM ver 1.11
Oct 08 07:13:07 kernel: hid-generic 0005:16C0:27DB.0007: input,hidraw2: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Oct 08 07:17:10 kernel: hid-generic 0005:16C0:27DB.0009: input,hidraw2: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Oct 09 07:13:47 kernel: hid-generic 0005:16C0:27DB.000A: input,hidraw2: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Oct 12 07:26:54 kernel: hid-generic 0005:16C0:27DB.000B: input,hidraw2: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Oct 13 07:23:31 kernel: hid-generic 0005:16C0:27DB.000C: input,hidraw2: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Oct 15 08:08:58 kernel: hid-generic 0005:16C0:27DB.0011: input,hidraw2: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Oct 16 07:13:39 kernel: hid-generic 0005:16C0:27DB.0012: input,hidraw2: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Oct 22 07:24:09 kernel: hid-generic 0005:16C0:27DB.0013: input,hidraw2: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a
Oct 23 07:53:17 kernel: hid-generic 0005:16C0:27DB.0014: input,hidraw2: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a


- Does not work properly, my keyboard (Glove80) is just working 
intermittently, only getting a few characters through sometimes.
# LANG=C journalctl --no-hostname --dmesg --grep '(hci0|bluetooth)' -b 
c18f0e74a98f438fa3853efed19fcfa2
Oct 23 13:29:16 kernel: Bluetooth: Core ver 2.22
Oct 23 13:29:16 kernel: NET: Registered PF_BLUETOOTH protocol family
Oct 23 13:29:16 kernel: Bluetooth: HCI device and connection manager 
initialized
Oct 23 13:29:16 kernel: Bluetooth: HCI socket layer initialized
Oct 23 13:29:16 kernel: Bluetooth: L2CAP socket layer initialized
Oct 23 13:29:16 kernel: Bluetooth: SCO socket layer initialized
Oct 23 13:29:16 kernel: Bluetooth: hci0: Firmware timestamp 2026.26 
buildtype 1 build 117936
Oct 23 13:29:16 kernel: Bluetooth: hci0: Firmware SHA1: 0xfa98b015
Oct 23 13:29:16 kernel: Bluetooth: hci0: DSM reset method type: 0x01
Oct 23 13:29:16 kernel: Bluetooth: hci0: Found device firmware: 
intel/ibt-0291-0291.sfi
Oct 23 13:29:16 kernel: Bluetooth: hci0: Boot Address: 0x100800
Oct 23 13:29:16 kernel: Bluetooth: hci0: Firmware Version: 35-29.26
Oct 23 13:29:16 kernel: Bluetooth: hci0: FW download error recovery 
failed (-19)
Oct 23 13:29:16 kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Oct 23 13:29:16 kernel: Bluetooth: BNEP filters: protocol multicast
Oct 23 13:29:16 kernel: Bluetooth: BNEP socket layer initialized
Oct 23 13:29:17 kernel: Bluetooth: hci0: Device revision is 0
Oct 23 13:29:17 kernel: Bluetooth: hci0: Secure boot is enabled
Oct 23 13:29:17 kernel: Bluetooth: hci0: OTP lock is disabled
Oct 23 13:29:17 kernel: Bluetooth: hci0: API lock is enabled
Oct 23 13:29:17 kernel: Bluetooth: hci0: Debug lock is disabled
Oct 23 13:29:17 kernel: Bluetooth: hci0: Minimum firmware build 1 week 
10 2014
Oct 23 13:29:17 kernel: Bluetooth: hci0: Bootloader timestamp 2022.18 
buildtype 1 build 16362
Oct 23 13:29:17 kernel: Bluetooth: hci0: DSM reset method type: 0x01
Oct 23 13:29:17 kernel: Bluetooth: hci0: Found device firmware: 
intel/ibt-0291-0291.sfi
Oct 23 13:29:17 kernel: Bluetooth: hci0: Boot Address: 0x100800
Oct 23 13:29:17 kernel: Bluetooth: hci0: Firmware Version: 35-29.26
Oct 23 13:29:19 kernel: Bluetooth: hci0: Waiting for firmware download 
to complete
Oct 23 13:29:19 kernel: Bluetooth: hci0: Firmware loaded in 2108443 usecs
Oct 23 13:29:19 kernel: Bluetooth: hci0: Waiting for device to boot
Oct 23 13:29:19 kernel: Bluetooth: hci0: Device booted in 52843 usecs
Oct 23 13:29:19 kernel: Bluetooth: hci0: dsbr: enable: 0x01 value: 0x0b
Oct 23 13:29:19 kernel: Bluetooth: hci0: Found Intel DDC parameters: 
intel/ibt-0291-0291.ddc
Oct 23 13:29:19 kernel: Bluetooth: hci0: Applying Intel DDC parameters 
completed
Oct 23 13:29:19 kernel: Bluetooth: hci0: Firmware timestamp 2026.29 
buildtype 1 build 120611
Oct 23 13:29:19 kernel: Bluetooth: hci0: Firmware SHA1: 0x239ed887
Oct 23 13:29:19 kernel: Bluetooth: hci0: Fseq status: Success (0x00)
Oct 23 13:29:19 kernel: Bluetooth: hci0: Fseq executed: 00.00.04.202
Oct 23 13:29:19 kernel: Bluetooth: hci0: Fseq BT Top: 00.00.04.202
Oct 23 13:29:19 kernel: Bluetooth: MGMT ver 1.23
Oct 23 13:29:19 kernel: Bluetooth: RFCOMM TTY layer initialized
Oct 23 13:29:19 kernel: Bluetooth: RFCOMM socket layer initialized
Oct 23 13:29:19 kernel: Bluetooth: RFCOMM ver 1.11
Oct 23 13:30:01 kernel: hid-generic 0005:16C0:27DB.0004: input,hidraw3: 
BLUETOOTH HID v0.01 Keyboard [Glove80] on e4:4a:e0:8a:26:3a

-- 
Andreas

