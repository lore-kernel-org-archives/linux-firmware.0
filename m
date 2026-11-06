Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B7A606D804
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=WGBFA/5i
Received: by smtp.kernel.org (Postfix)
	id B1C4F1F008A1; Fri,  6 Nov 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=fail smtp.remote-ip=176.119.200.161
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=fail;
	t=1793964797;
	b=qUfsgh7+QOZIQEWFydVslfqZeek/C0azWNPXyv76X3Q90CY28VY8ZYv3z34MfqpW0Jx0
	 mEpMo4fK2ZfVWbcUDDcSCbZGjXoAdJh9Yif/5rm6eqa7YMp0L7bCgURnv3SK8E9X+BN8W
	 s3MofuEcc1K+kSxs2WqGu94V1TwLC3FOceagYOG3Dwt1P/171/ktLrBgrtIjEd1sR+EsT
	 My9lDSvm98qary7gTmOtdtF+/gPdNIK6oHjLVov6eqHBouU79eeoyRzauI+6WWJQhLmMa
	 o7oNnZYDivlMHbGgEDvqPrOPeRZ9I81YcXEknI1OnEkw9X5FJBaI/sVx5/BIhtuE2wg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793964797;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:List-Id:To:Cc:Message-ID:
	 X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=WjqRnly3QXrV5oRbLKUYSY/9CRZtL5OnrhNafFbfOuI=;
	b=yRN3YjeB8EVZ05Pzi4YQVvoMRmK30JP58FpS91SxOZw5EeKM6tuERyAR/gwtmHxKXNYn
	 HwqKPML9nxT3nLQOKkyWgi3DI875Md0+JtV1L84h7MMbAKCCQfr9US1krcLwrpnU/DbIT
	 lSB3czrKr44tCHJTKw/rZeMTeKdUF70T1Sjv2wpZj8s8jJAuU9ExwH2svwrIIH+HsVZ6/
	 C15w0zTLU1VbtDk1oCN/cjVLzMN6T16ddpGqVDAZKqNNangI4ZIkx9gZl+eoTF01orewA
	 UqOzRIrY8HICqewSGfA+D5AWOBFt1YWifiKuYuTKvu6Q0mQIU42WBtnTAZr9zG1HHwQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b="WGBFA/5i";
	dmarc=pass header.from=8alias.com;
	spf=pass smtp.mailfrom=8alias.com;
	arc=fail smtp.remote-ip=176.119.200.161
Received: from mail-200161.simplelogin.co (mail-200161.simplelogin.co [176.119.200.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EABC61F008A2
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 11:33:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=WGBFA/5i
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EABC61F008A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=8alias.com
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793964789;
	cv=none; b=hO3y+9ZYLrIPMTFNVr8yZre/R/X9fesSpuS8qBqzOI3tyGPLPEPUy95V7c9JQROQafmDbhXsXO7MH01y7UE7+Po8GmZJbpNVl7C9fATBQs9K6VriLHi4dPzzlJMObtFmp0+Vh02utytuKbl8FXuupdQdLbvX73WoZvV1RQ9ZRqux3zRlXPE3eRregHuihsu7856m2ql/h3r8ZGHCeUuB7+olu2bnMUbzN+uExbjWT79WdNXaxyWTb7TJtzPFMiHZ4enR9RPsrFAGCyN9jhYiSpGo6EbfUpEFqNJdK91AvnPfmrmbe3mxhLVRGx6CD51I9/INV9NcKqE1DGs0Q/M0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793964789; c=relaxed/simple;
	bh=eFZc2QZJXA1E5rl4kFAgFfKCL1PqffOVPuDSICVOW00=;
	h=Date:Subject:From:To:Cc; b=PVnyxhSZPsbobrvcj2hfohl2I1kZ4RdyYpm2kACfR/fvM5tIrv9/PW8tzWfBdgou9HNaK9X8LYmQ4dL5/hlDQ3QtIZektjofWvGSQ6EmVE52x47e1bgJzv9g541ame6zkeWlz+cup0k4tDP93puVT7G+/hnuLmSEoqbWrOUnuB/DVFjL+uf3QtTIvLrmXSjTTw3SQIu5g+MPORVbFTJcUPOBV8GkStrKRt4Y2jMty6ApmSNX2cqWJezK5AQw3BfqDjldf668y4zU+Aezjxu9P/Oqvhlhye4AvKFNUy1d8QFgH5tRfN87QIdIJZ+iJe4YgTn11+wVVKq1bJ7eoKw+9w==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1793964789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WjqRnly3QXrV5oRbLKUYSY/9CRZtL5OnrhNafFbfOuI=;
	b=WGBFA/5ihEmpSO9V3ChGAdCvFG7kyFHnC4WJcMxneOBqHUyA2XEA11ggZ0EjX8Iux2nGxT
	53RrN6P/HlLkaUH3TBYjbnomM2+OUNSTKNvxXoUWysvC3ELEROgdekAn7Y/Ei8PmLCTGn/
	m1Uzz9Vi6MlcdVbJrSWjQUE7wrgM9r0=
Date: Fri, 6 Nov 2026 12:33:07 +0100 (CET)
Subject: [PATCH] ti: tas2781: Add firmware names for ASUS models without a
 speaker ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
From: linux-kernel.supreme403@8alias.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: baojun.xu@ti.com,Shenghao Ding <shenghao-ding@ti.com>
Message-ID: <179396478879.8.13751503013951596382.1751156862@8alias.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1751156871
X-SimpleLogin-Want-Signing: yes
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The TAS2781 HDA driver builds the DSP firmware filename from the codec
subsystem ID and, when available, the speaker ID read through a GPIO.
For ASUS TP3607SA (1043:3e30), it chooses:

 speaker ID 0:       TAS2XXX3E300.bin
 speaker ID 1:       TAS2XXX3E301.bin
 ID unavailable:     TAS2XXX3E30.bin

On TP3607SA with BIOS 308 and Linux 6.18.59, the GPIO lookup returns
-ENOENT. The TAS2781 device in ASUS's BIOS 308 ACPI tables defines only
I2C resources. The driver therefore requests TAS2XXX3E30.bin, which
linux-firmware lacks.

ASUS TP3407SA (1043:10a4) uses the same naming rule and needs
TAS2XXX10A4.bin when the speaker ID is unavailable. Unsuffixed aliases
have been used successfully on both models.

The patch below adds the two names requested in this case:

 TAS2XXX10A4.bin -> ti/audio/tas2781/TAS2XXX10A40.bin
 TAS2XXX3E30.bin -> ti/audio/tas2781/TAS2XXX3E300.bin

For each model, the speaker-ID 0 and 1 binaries are byte-identical, so
either variant provides the same firmware contents for the unsuffixed
name. These links let both models load their DSP firmware automatically.

---
 WHENCE | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/WHENCE b/WHENCE
--- a/WHENCE
+++ b/WHENCE
@@ -10885,6 +10885,7 @@
 Link: TAS2XXX103C8DE8-1.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
 Link: TAS2XXX103C8DE9-0.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
 Link: TAS2XXX103C8DE9-1.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX10A4.bin -> ti/audio/tas2781/TAS2XXX10A40.bin
 Link: TAS2XXX10A40.bin -> ti/audio/tas2781/TAS2XXX10A40.bin
 Link: TAS2XXX10A41.bin -> ti/audio/tas2781/TAS2XXX10A41.bin
 Link: TAS2XXX11540.bin -> ti/audio/tas2781/TAS2XXX11540.bin
@@ -10933,6 +10934,7 @@
 Link: TAS2XXX38FD.bin -> ti/audio/tas2781/TAS2XXX38FD.bin
 Link: TAS2XXX391F.bin -> ti/audio/tas2781/TAS2XXX391F.bin
 Link: TAS2XXX3920.bin -> ti/audio/tas2781/TAS2XXX3920.bin
+Link: TAS2XXX3E30.bin -> ti/audio/tas2781/TAS2XXX3E300.bin
 Link: TAS2XXX3E300.bin -> ti/audio/tas2781/TAS2XXX3E300.bin
 Link: TAS2XXX3E301.bin -> ti/audio/tas2781/TAS2XXX3E301.bin
 Link: TAS2XXX3EE00.bin -> ti/audio/tas2781/TAS2XXX3EE00.bin

-- 
assembledev

