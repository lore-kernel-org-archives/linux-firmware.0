Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1324606A326
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 20:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=sdVg58Xd
Received: by smtp.kernel.org (Postfix)
	id CB47A1F008A1; Fri,  6 Nov 2026 20:38:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.170
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793997530;
	b=BMCMzxrdTSn8YekYLJRe4vA/4CPp68pqOI7usYE1lzcap9hp82mQbqhJCVy/aEwt7QEa
	 CGutVYmkZwqPUwkmeZLn6QJ0Mp0cTnFEgqaxU42DTSIKQeKs/xqb2FTKVC8svAwX+m+Pp
	 VdYLwRkUfCNsU4ywSXo0S7MDH3ZjB6WjYG7iK17juKCPSMUQXWXTrJNAXfsXMRzSEKgns
	 Zi4xN5+aI59dkUV2hqx/cRoeNh1QtpYpZY0EnHu6m8KEOnLtx+yzqCBlbo7yi3U3EtnVw
	 BKPX98szp5iRbhYuzcKjce4SbQHYuEA3i/A/WIrhDfgYJoDTNpTvgBMFVLiDEF5i5Mw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793997530;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From:To:List-Id:Cc:Message-ID:
	 X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=SlXYns12x8caeuJWtdPGe1NhvPJs4krxF4pmE/qxlzg=;
	b=yjR3/g03mDSsQvoJEZApTkmB66gWjK+Wdzul7vvydvBfoe3dhKTuWagAFV8E05hQflZf
	 4c6lul9JF3ZiGmQYj/oLqUoPliWcjGPQI1fi38LtgEstGTdYDG1/cdTqWABVhuyY4IG62
	 BhmZcu6wq3DVeFh/WPNA0cLaA9IbIO3EJmHGw6jqG3O2coQPdXiV0dhAOyy+kW3MByoTz
	 JPngzNO0oc34UjTs6iqydksnqfHxbDJpVYseZTRJwBO6g+lNr1R9RXkoW+dudipkWVHib
	 xOHnM1EEwmSlmcBx44gmI9puET2GuxkVwjMx57yraj2KcXhV9A4xc/ke/CqoNV5C9bg==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=sdVg58Xd;
	dmarc=pass header.from=8alias.com;
	spf=pass smtp.mailfrom=8alias.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.170
Received: from mail-200170.simplelogin.co (mail-200170.simplelogin.co [176.119.200.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFE921F0089F
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 20:38:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=sdVg58Xd
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EFE921F0089F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=8alias.com
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793997527;
	cv=none; b=1l/HsUAxtiFvrGdMcOa+52BhyLd3ov0Sye3q25sOl9hbb8+NNcN7x1nKuwqmiDnmXTDbURDqdqVvrcdTFILHPcGtDXd3nUJV7dkIsoCO1kM+r6fZWaCh4OWvyCHWvs0vwTycE3fq+K3SPDQXDrU503qrHGk1EHpfFACMK13M0vFVqhnAmKK8D1cK6anc5QGqjIhkBIwUK43lBMEABDqf0DXVBLx/1WIGTX4qq9BEZHE0lD+omKNTYlMaL7AoDFVzPx0N0ZmyxRIua+SXDsAgI4ai9axjfPu5nEfQZV9EYdVszF4O3mbBoMunH/6HC4p6325HVmrEmyQBoEh7Lf+ccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793997527; c=relaxed/simple;
	bh=SlXYns12x8caeuJWtdPGe1NhvPJs4krxF4pmE/qxlzg=;
	h=Date:Subject:From:To:Cc; b=Qfe5yyYZ0o6FYYxJoS0jAZqCEICOtUsAVTLBNV3MPpO32bx1qIhDIeSzGg6VhfS//g6eCp3Mf+drCpsh0bAl/oAFBRPU3bOxKHWH3/wUGOoyaY69AurYsQ0Yj5Yo5CNLg3qQcNDmoVublQvosYMgOTfEUX/TCxwcrBO1MJSkeePDA96n7j1Qj60IYb0hEH9VZTDY569FHRhXPBTFyksXpzoGnnz0TRNkERdkKcry2X4MZsmR4V6lcvHcsjHnobVVEXm2QmTC6Ns2y1pRy26y5rseesAx3RQXyZCPRt2edYKX7cIDClHbOlRH7U70W/yB1PGv5WB+Zxr0t3TJyCEE6w==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1793997527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SlXYns12x8caeuJWtdPGe1NhvPJs4krxF4pmE/qxlzg=;
	b=sdVg58XddXZOmAgBGpkN/Em/II1jWhSZj653SymXT4Mt6O8W5nlJKT3juXTMzDdoxxXGzm
	uLtF7PJO6kkgzLunRL0bK3dS0QvarIt25e0DVPBqdBiXArEepbiCk1WxJI9vuJwiPYK4Nq
	S9zJSdYwpoKgol1GJhpRB/TgYOTh4YI=
Date: Fri, 6 Nov 2026 21:38:45 +0100 (CET)
Subject: ASUS ISH firmware missing from linux-firmware
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
From: linux-kernel.supreme403@8alias.com
To: lixu.zhang@intel.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: srinivas.pandruvada@linux.intel.com,linux-firmware@kernel.org
Message-ID: <179399752711.7.15225270877012116394.1752629036@8alias.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1752629042
X-SimpleLogin-Want-Signing: yes
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lixu, Srinivas,

Could you help get ASUS's Lunar Lake ISH image into linux-firmware, or
point me to an ASUS contact who can submit it with a redistribution
license?

I'm currently extracting ishS_SI.bin from ASUS's Windows SensorHub
package to get working sensors on a TP3607SA. With BIOS 308 and Linux
6.18.59, the accelerometer and hinge sensor work with this image.

ASUS package:
https://dlcdnets.asus.com/pub/ASUS/nb/Image/Driver/Chipset/41057/SensorHub_DCH_Intel_D_V5.8.32.0Sub1_41057_1.exe

The file inside it is:
 Drivers/IshHeciExtensionTemplate/x64/FwImage/0003/ishS_SI.bin

The image is also used on TP3407SA. The matching firmware names are:
 TP3607SA: intel/ish/ish_lnlm_ef534c00_e7d353a6.bin
 TP3407SA: intel/ish/ish_lnlm_ef534c00_a5460864.bin

Thanks,
assembledev

