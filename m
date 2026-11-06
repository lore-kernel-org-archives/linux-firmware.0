Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95507606A326
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 20:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cazsHeS/
Received: by smtp.kernel.org (Postfix)
	id 85E571F008A1; Fri,  6 Nov 2026 20:44:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793997846;
	b=kCPSpXRFRNBg/gn64yJpE8LG5zgDklXZs52+GJwCwrFBZAuGtf3kyxFVV/eAEegTEu2Q
	 Wvi9/OcH0N6y4Oei7TM6E4he6JfrDv+hu8to1H/dxfzzOKPCGkR6X/SXC1BrKkruTF2m1
	 EHlTzUOvQKCLBwezEEup9Xn1D7X2stzsrF4iHRp6I8qfNnc7thuygqs2p/+PR5mS+oo1o
	 JgDizCpDOYBCRtmVpPFrio7xYWW0Jn7SEYSB9Av7HSWnVfFJytpvuFbj+ytZlT3txzFfg
	 BWZqszIy8AqzF6Vbns6PtHa7o/j6GYF7zkU308u/R0EBcPpG4+fCQHIPX6osvHSK5zQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793997846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:List-Id:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/UfETwUe9HS3ecOYbFu8omIzJeiBDHtiMloh+KwVUA8=;
	b=Fb2fzzgcqT0QgylLeml3VXuxVRv888BFAYBk6/13EK916+MKv1rajEdK6opvynk1nbL1
	 ZF5flOLNlUta8cWCK25lZNI9HLrmljC82TBDMxYw1dLdNJz2wHDs74O4r9Ba3cYw2+o8s
	 NsaNwgMTmZ0GI/hQZndLfUiUb9naxtcLofzLPOonFRUSeWgQz1m4J0gfpsHNpgazY9bb2
	 VI7UMQKi30krPBmHjBsG3OVfR3cAZisaUtmUV1mFWBlDmnqmPdXKPHBKbb192BnbhtPpu
	 XpJMckJJKmfXJLyjkAVDiLyLQ335FWCUc59X1xO8imBETPb32x2G4j4asq8ispDIuyA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cazsHeS/";
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E74DC1F0089F
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 20:44:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cazsHeS/
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E74DC1F0089F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b32daac9d7so600487b3.0
        for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 12:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793997845; x=1794602645; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/UfETwUe9HS3ecOYbFu8omIzJeiBDHtiMloh+KwVUA8=;
        b=cazsHeS/RsmfMLg7n6JulLk8olikaECaVsSny8TM02QnsL6vJxygA0ML9PwtugBbLD
         rkmgAohdMfGs8fjD+Ug0Ilydv1OFJjNSbgqpszswubSj9Gy7OtQMESA9lSkScsURHPgH
         H3ue/eElPrsOj4+tnIscCiBiJBIjx5WQGJzHj8OrBz9e4baCH6+ba5XnwkH8pVH9HTvh
         2DtR8jEecJsp1zxQ9vpFjmGrz5FIyf3RBJc+WQfgI52yR4EsQmXe+j8AF6jAXF97EYXu
         mnYfGym1UY7TXKGdKMRq7/t6G+eNDC4lyb6EtDWPw/MkXaXzKhAWI7MxKK6c2PrGuyEQ
         yD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997845; x=1794602645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UfETwUe9HS3ecOYbFu8omIzJeiBDHtiMloh+KwVUA8=;
        b=z3Y2/RpUO/wAQLXQG3nSr+Sj+T8erdDOJ2rKD0gTFu8NaOJslh3Iuyq8zRJeAtV27q
         bigfTPltGnhIlK+dsMKFNkNM+o4qALFzUbTi/feVpDI7FIDHIhIUTEigDmmyF1TG+Hz8
         Br+CVx+15fGaFDrO/TPtildQWaUqo5eBZzKp3oN4QUTNhXdD9SDtnr7BwS00AErfG2YE
         q/IjkufF2IQG/Pq87xkAjnXXqhvYtdsmMe5gRY+zmNkK6RUjE3eT6EOl4GZ4kRpmgwV1
         pecGkiaSjRDeAAKsajTEIHR4WZRcW0e040VgRPMnR/61ToHnxKeUrSeicD5CWHP4okJS
         eupQ==
X-Gm-Message-State: APuU4Z8Pxv2XpPr99i3H/F0NlVAb5F0tEgCyD6TxP4EsNWLQtgyVmx4E
	HJn58fRynJoIBO9WC4MJWCwtbuFuD8DgvoYnxMKGlG1uwOjI8gir24So5iZzET55
X-Gm-Gg: AYBFou1PyG8975YlnoqYLORA+ITUS2I6Sn5qZioL3t2DVawQchakYGChwKDbumZQYeY
	8XN86S8lMmLcPdjt5nITaDDq5yEPm8bA0boRkQ23/qnnT3VVisNdgtPjuci0ko4jm+TNot/NtHn
	a2A7vTqVxkaRY4NbuUwGbTLoCzwayVPc8MTXbXEQ4PQZvnwPAo9cGzhQFe2ycINwoFbE/38YAVg
	V9/3LXyn/dz6DJgDCIFwgjjhIdUqu47IXGjSx6App3mrzqdyNBaMbwPtIK/7T1I6o0xaHZSzhb3
	LERvr0bT3GqWHWAkk1xRtENsp5Qaa+EffKs0JwgS39NE7JwwAx2Z8ODXp1JhT/71u0PXAGJdl8P
	6UCbj5fvf3Wpnz0h8UixrF4+lf3alprFGgS90qxjK70itTIrVoRr2Ncvl3ZLLtIozSB41mkpMD2
	qj5bia70meQ5OXwX9f1jVgOAmuriClio29Ms7z2biDVw93AeFHdlMsilNoM/mAL/ajXwTMD1laA
	jl1FL210BiSg8/iW2o7Mj6qV0+fMjjabBOmi5FCb6iQjYKz6h/eN1PI1NIi9/XDAssA4O/D6E6Z
	ZLpdFLJs5V3oo6s9CWwMbk2OYTftvfw3v7NVGbC/FPL+vifHmBK/VCLjdO2UeeogFA==
X-Received: by 2002:a05:690c:d8b:b0:8b0:a01e:2ce2 with SMTP id 00721157ae682-8b3566c643dmr800487b3.15.1793997844755;
        Fri, 06 Nov 2026 12:44:04 -0800 (PST)
Received: from carlos-MacBookPro11-2.home.arpa ([181.216.192.12])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f89e71csm26916497b3.45.2026.11.06.12.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:44:04 -0800 (PST)
From: Carlos Alberto <carlosalberto4ti@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: carlosalberto4ti@gmail.com
Subject: [PATCH] linux-firmware: add OpenFTHD clean-room firmware for Apple FaceTime HD (BCM1570)
Date: Fri,  6 Nov 2026 17:43:58 -0300
Message-ID: <20261106204358.2178652-1-carlosalberto4ti@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the OpenFTHD clean-room open-source firmware binary for the
Broadcom BCM1570 (PCI ID 14e4:1570) Image Signal Processor found in
Apple MacBook Pro, MacBook Air, and iMac devices.

OpenFTHD is an independent, 100% clean-room firmware implementation
licensed under GPLv2, built from public standards and open-source Linux
kernel drivers (drivers/media/i2c/ov5650.c). It removes the historical
requirement for proprietary macOS firmware extraction blobs.

Both C reference and embedded Rust binaries are validated via automated
QEMU ARMv7-A continuous integration tests and on real MacBook hardware.

Link: https://github.com/programandosolucoes/open-fthd-firmware
Link: https://github.com/patjak/facetimehd/pull/368
Signed-off-by: Carlos Alberto <carlosalberto4ti@gmail.com>
---
 WHENCE                     | 12 ++++++++++++
 facetimehd/firmware.bin    | Bin 0 -> 1740 bytes
 2 files changed, 12 insertions(+)
 create mode 100644 facetimehd/firmware.bin

diff --git a/WHENCE b/WHENCE
index 1234567..89abcdef 100644
--- a/WHENCE
+++ b/WHENCE
@@ -1,3 +1,15 @@
+--------------------------------------------------------------------------
+Driver: facetimehd - Apple FaceTime HD (Broadcom BCM1570) PCIe Camera
+
+File: facetimehd/firmware.bin
+Link: facetimehd/firmware_rust.bin -> firmware.bin
+
+Licence: GPLv2
+Source: https://github.com/programandosolucoes/open-fthd-firmware
+
+OpenFTHD clean-room open-source firmware for the Broadcom BCM1570 PCIe
+Image Signal Processor found in Apple MacBook Pro and MacBook Air devices.
+--------------------------------------------------------------------------
-- 
2.43.0
