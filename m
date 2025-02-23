Return-Path: <SRS0=T35O=VO=tteles.dev=mail@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCA9C021B2
	for <linux-firmware@archiver.kernel.org>; Sun, 23 Feb 2025 16:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3254FC4CEE4; Sun, 23 Feb 2025 16:08:25 +0000 (UTC)
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 007EDC4CEDD
	for <linux-firmware@kernel.org>; Sun, 23 Feb 2025 16:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 007EDC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tteles.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tteles.dev
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 09CDF63DBCD6;
	Sun, 23 Feb 2025 17:08:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740326892;
	s=s1; d=tteles.dev;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=anHw/tWouDACDO0fhJT0m8cOjTOnowx0CzjorcPZDh4=;
	b=Fz+mepONBtUGBpIubWO+Km3xs3qoCRgaQ/uYxuP9cSluH27z0bL2+Dl3Pq8PahV1
	xaOrb8oxkMo5+nt0Mvw7jZ09dDDUV6xft7j9ILovkm4qD0vzkLKz2/il7odUJfMhXrK
	qrmq1WYVcEBzGvHYxkqjv237QqmZyhoPaV3Jp5cngp9jSv70LJlwyB4+/10d/Q+U7ws
	PmdLHrGZ8OhNkb8FYfCX5A1DbHPQekOIyjAGlG+kJWYiW4HxYtHXLMqg1NyEvNijgYt
	xBaybUDMkf5h1ZVDEXlgXLJsRYnFRcPtB/BEkSz8ruYR9e2/X6tsyeU0zJ/bhetbYvJ
	aNSvM3hxDw==
Date: Sun, 23 Feb 2025 17:08:12 +0100 (CET)
From: mail@tteles.dev
List-Id: <linux-firmware.lore.kernel.org>
To: Alexander Deucher <alexander.deucher@amd.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Xinhui Pan <xinhui.pan@amd.com>, Airlied <airlied@gmail.com>,
	Simona <simona@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>,
	Tzimmermann <tzimmermann@suse.de>,
	Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ahmad Rehman <ahmad.rehman@amd.com>,
	Shaoyun Liu <shaoyun.liu@amd.com>,
	Ramesh Errabolu <ramesh.errabolu@amd.com>, Jun Ma2 <jun.ma2@amd.com>,
	Amd Gfx <amd-gfx@lists.freedesktop>,
	Dri Devel <dri-devel@lists.freedesktop>,
	Daniel <daniel@makrotopia.org>,
	Linux Firmware <linux-firmware@kernel.org>
Message-ID: <OJnZDtd----9@tteles.dev>
Subject: REGRESSION  amdgpu 20241108 firmware breaks screen updating
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Greetings,

I wish to report a regression in amdgpu firmware introduced in commit c99ee=
b4d0e13f5831ae77f7ec521162594385d5f, the problem persists until git HEAD, a=
nd reverting to the previous commit fixes the issues with no further change=
s to the environment.

The issue appears on a Lenovo IdeaPad Pro 5, with a Ryzen 8845HS processor,=
 using the 780M iGPU (1002:1900 I believe). The screen on this laptop is 12=
0Hz 2800x1800, supporting HDR.
This was tested on Archlinux 6.13.3.arch1-1, with amdgpu drivers, on both W=
ayland (Gnome and Hyprland) and Xorg (i3wm). I'm using amd-pstate-epp scali=
ng driver, tested with both performance and powersave governers, to the sam=
e effect.

I will list the symptoms and attempt to guess at what the issue may be.

- The screen stops updating if no mouse input is given while watching low r=
esolution video (wherever it is, Brave and mpv, regardless of software or h=
w decoding).
=C2=A0 Low resolution matters here, I can play 4k video fine, 1080p with mi=
ld stutters, but lower becomes very bad.=C2=A0
=C2=A0 Here is an example using mpv with 360p sample video, recorded on my =
phone as to not disturb the environment its running in. (https://youtu.be/k=
YHqBjPxM2s You can tell it is very choppy, the original video https://www.y=
outube.com/watch?v=3D1HrXwe6s4W8 is not choppy)
=C2=A0 mpv did not report any dropped frames despite there obviously being =
a huge amount.

- In some programs, text does not get displayed instantly from when typing =
it, having to type 5 or 6 characters for the previous to finally show.=C2=
=A0
=C2=A0 All these new characters show up at the same time. This was extremel=
y noticeable with gnome's default "Console", it also happened in Brave Brow=
ser's search bar, and Signal, it does not seem to happen with Ghostty.

Constantly waving my cursor fixes all these issues. Connecting a secondary =
display seems to fix the issue on all displays.

From my limited knowledge this seems like a bug in damage detection for eDP=
 + power management, where low enough power levels don't trigger redraws.

I am confident the issue was introduced in that commit since I bisected lin=
ux-firmware commits affecting amdgpu until the issue was no longer found.


Extra info:
# dmesg | grep amd
[=C2=A0=C2=A0=C2=A0 0.414396] perf/amd_iommu: Detected AMD IOMMU #0 (2 bank=
s, 4 counters/bank).
[=C2=A0=C2=A0=C2=A0 1.875492] [drm] amdgpu kernel modesetting enabled.
[=C2=A0=C2=A0=C2=A0 1.878563] amdgpu: Virtual CRAT table created for CPU
[=C2=A0=C2=A0=C2=A0 1.878573] amdgpu: Topology: Add CPU node
[=C2=A0=C2=A0=C2=A0 1.882607] amdgpu 0000:63:00.0: amdgpu: Fetched VBIOS fr=
om VFCT
[=C2=A0=C2=A0=C2=A0 1.882610] amdgpu: ATOM BIOS: 113-PHXGENERIC-001
[=C2=A0=C2=A0=C2=A0 1.909536] amdgpu 0000:63:00.0: vgaarb: deactivate vga c=
onsole
[=C2=A0=C2=A0=C2=A0 1.909542] amdgpu 0000:63:00.0: amdgpu: Trusted Memory Z=
one (TMZ) feature enabled
[=C2=A0=C2=A0=C2=A0 1.909612] amdgpu 0000:63:00.0: amdgpu: VRAM: 4096M 0x00=
00008000000000 - 0x00000080FFFFFFFF (4096M used)
[=C2=A0=C2=A0=C2=A0 1.909614] amdgpu 0000:63:00.0: amdgpu: GART: 512M 0x000=
07FFF00000000 - 0x00007FFF1FFFFFFF
[=C2=A0=C2=A0=C2=A0 1.909829] [drm] amdgpu: 4096M of VRAM memory ready
[=C2=A0=C2=A0=C2=A0 1.909832] [drm] amdgpu: 13932M of GTT memory ready.
[=C2=A0=C2=A0=C2=A0 1.935030] amdgpu 0000:63:00.0: amdgpu: reserve 0x400000=
0 from 0x80f8000000 for PSP TMR
[=C2=A0=C2=A0=C2=A0 2.482626] amdgpu 0000:63:00.0: amdgpu: RAS: optional ra=
s ta ucode is not available
[=C2=A0=C2=A0=C2=A0 2.491068] amdgpu 0000:63:00.0: amdgpu: RAP: optional ra=
p ta ucode is not available
[=C2=A0=C2=A0=C2=A0 2.491071] amdgpu 0000:63:00.0: amdgpu: SECUREDISPLAY: s=
ecuredisplay ta ucode is not available
[=C2=A0=C2=A0=C2=A0 2.521960] amdgpu 0000:63:00.0: amdgpu: SMU is initializ=
ed successfully!
[=C2=A0=C2=A0=C2=A0 2.601611] kfd kfd: amdgpu: Allocated 3969056 bytes on g=
art
[=C2=A0=C2=A0=C2=A0 2.601628] kfd kfd: amdgpu: Total number of KFD nodes to=
 be created: 1
[=C2=A0=C2=A0=C2=A0 2.602048] amdgpu: Virtual CRAT table created for GPU
[=C2=A0=C2=A0=C2=A0 2.602191] amdgpu: Topology: Add dGPU node [0x1900:0x100=
2]
[=C2=A0=C2=A0=C2=A0 2.602193] kfd kfd: amdgpu: added device 1002:1900
[=C2=A0=C2=A0=C2=A0 2.602206] amdgpu 0000:63:00.0: amdgpu: SE 1, SH per SE =
2, CU per SH 6, active_cu_number 12
[=C2=A0=C2=A0=C2=A0 2.602212] amdgpu 0000:63:00.0: amdgpu: ring gfx_0.0.0 u=
ses VM inv eng 0 on hub 0
[=C2=A0=C2=A0=C2=A0 2.602215] amdgpu 0000:63:00.0: amdgpu: ring comp_1.0.0 =
uses VM inv eng 1 on hub 0
[=C2=A0=C2=A0=C2=A0 2.602216] amdgpu 0000:63:00.0: amdgpu: ring comp_1.1.0 =
uses VM inv eng 4 on hub 0
[=C2=A0=C2=A0=C2=A0 2.602217] amdgpu 0000:63:00.0: amdgpu: ring comp_1.2.0 =
uses VM inv eng 6 on hub 0
[=C2=A0=C2=A0=C2=A0 2.602219] amdgpu 0000:63:00.0: amdgpu: ring comp_1.3.0 =
uses VM inv eng 7 on hub 0
[=C2=A0=C2=A0=C2=A0 2.602220] amdgpu 0000:63:00.0: amdgpu: ring comp_1.0.1 =
uses VM inv eng 8 on hub 0
[=C2=A0=C2=A0=C2=A0 2.602221] amdgpu 0000:63:00.0: amdgpu: ring comp_1.1.1 =
uses VM inv eng 9 on hub 0
[=C2=A0=C2=A0=C2=A0 2.602222] amdgpu 0000:63:00.0: amdgpu: ring comp_1.2.1 =
uses VM inv eng 10 on hub 0
[=C2=A0=C2=A0=C2=A0 2.602223] amdgpu 0000:63:00.0: amdgpu: ring comp_1.3.1 =
uses VM inv eng 11 on hub 0
[=C2=A0=C2=A0=C2=A0 2.602224] amdgpu 0000:63:00.0: amdgpu: ring sdma0 uses =
VM inv eng 12 on hub 0
[=C2=A0=C2=A0=C2=A0 2.602225] amdgpu 0000:63:00.0: amdgpu: ring vcn_unified=
_0 uses VM inv eng 0 on hub 8
[=C2=A0=C2=A0=C2=A0 2.602226] amdgpu 0000:63:00.0: amdgpu: ring jpeg_dec us=
es VM inv eng 1 on hub 8
[=C2=A0=C2=A0=C2=A0 2.602227] amdgpu 0000:63:00.0: amdgpu: ring mes_kiq_3.1=
.0 uses VM inv eng 13 on hub 0
[=C2=A0=C2=A0=C2=A0 2.609481] amdgpu 0000:63:00.0: amdgpu: Runtime PM not a=
vailable
[=C2=A0=C2=A0=C2=A0 2.610787] [drm] Initialized amdgpu 3.60.0 for 0000:63:0=
0.0 on minor 1
[=C2=A0=C2=A0=C2=A0 2.617618] fbcon: amdgpudrmfb (fb0) is primary device
[=C2=A0=C2=A0=C2=A0 3.788332] amdgpu 0000:63:00.0: [drm] fb0: amdgpudrmfb f=
rame buffer device
[=C2=A0=C2=A0=C2=A0 5.120419] kvm_amd: TSC scaling supported
[=C2=A0=C2=A0=C2=A0 5.120426] kvm_amd: Nested Virtualization enabled
[=C2=A0=C2=A0=C2=A0 5.120428] kvm_amd: Nested Paging enabled
[=C2=A0=C2=A0=C2=A0 5.120430] kvm_amd: LBR virtualization supported
[=C2=A0=C2=A0=C2=A0 5.120443] kvm_amd: Virtual GIF supported
[=C2=A0=C2=A0=C2=A0 5.120444] kvm_amd: Virtual NMI enabled
[=C2=A0=C2=A0=C2=A0 5.170720] snd_hda_intel 0000:63:00.1: bound 0000:63:00.=
0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[=C2=A0=C2=A0=C2=A0 5.191443] amd_atl: AMD Address Translation Library init=
ialized


Thank you for your time,
Tiago Teles

