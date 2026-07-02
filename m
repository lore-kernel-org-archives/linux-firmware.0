Return-Path: <SRS0=Be/k=E4=leemhuis.info=regressions@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E20C43458
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Jul 2026 07:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB1411F00A3A; Thu,  2 Jul 2026 07:44:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=188.68.61.107
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782978271;
	b=ee85FjNEpNwT3sxD1yRZo8TA4Lizcc5cKzJ9QT7lgrGxCV/x7IzgeAfFhPvTzBDnhzrZ
	 JlbnvNGROXCW2lrzUgBLnFmeSVxjt2QLkf32LHNQOh3RW5jAy++stsBjJECtlY2D6ePNC
	 Irz9iUxYnCkQpK4L+EhYCzC0/Xn+RQ3hgr5Ad1IJj06rawfMsooMBOzSXAtbxFcJYwlO9
	 QTI7CKwVoLuqATsuzTJt5z4JwT82d5YrEnVVCzB5tstRDg13vU4m7AsjyESwdxXTfXiVZ
	 L6Zu1K6qGTzmRye3HrFmTzjoG1Dmtj7xJlbOI+LSAje1O23AKwu3slje54AuaXKpxEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782978271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:List-Id:
	 To:References:From:Content-Language:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=uZFP4/Ai/ccuRZlsKdFoZ8cW05Nidc7IQZpLR2zfLKY=;
	b=CJAXwOMK8gkZjGw98CZaseRn9hmqtHP7/2u7nNlZxeuMcNhQG424WrwINB+uq2fprVz8
	 CtSUXI5/nz8TaZ/simGmNoRQjnqhLue4xK2v21w0nCfPZqP5oJyyLuGHcqEGUbqtxQI/g
	 +59jOvqp7mEjWKEU/++3HkauIH+lxEB0lAquMbLzju0xsnzYPoFTN4mv1BWR8e1rom2xj
	 SneByyNsDfQvxMZcAUCyelzkmveqKaQM9Wnhw1thFoBpd313N/YYjCrzLUc9PN2cy+zWO
	 MBrlFGzWcGhalW5gl42qBHhYl/VGz7PWNC15jhTZaIX5OBt0bbniQM3H1WevvFvu8iw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=TjtJ1wMw;
	dmarc=none header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	arc=none smtp.remote-ip=188.68.61.107
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A7061F000E9
	for <linux-firmware@kernel.org>; Thu,  2 Jul 2026 07:44:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=TjtJ1wMw
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2A7061F000E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4grTRT0yj5z78xf;
	Thu,  2 Jul 2026 09:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1782978261;
	bh=TsN6WMMBCEo3X7M+PaHTEiPe/r/MX65+aVkikPoZo+8=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=TjtJ1wMwyQhbAj5p3WcdecFKurKvL1gKgOZBAFY7bOfBZpq7hogycwScebDww3mTi
	 SEjfzI7PBhKif6OHy6RC2pR8cm6hObzSgIhJgn5n0SX5Ps9wcYHjvOHGDh7iQD3KGW
	 q6m7bEHFEPxQ+4Eqyci7OJgHSzMWDDvRg46UIX9qK3t+yFiSAZomCJDrccs4014Sio
	 bvmkdw4r88FNxN9R8Oga14/X3X0tDHtOCsh7eSGZjzEeL2W54VJUQfiOv0Ufdo58pO
	 1WmFrpF5xzXENt1jiSpgyVPvra+Jtq6gXQcwAEUChK9xnEQm4y6aGdzPGR4Knzd0+b
	 dCZNlHSOXtQYA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4grTRT0Gcvz78xd;
	Thu,  2 Jul 2026 09:44:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4grTRR5mvhz8tYM;
	Thu,  2 Jul 2026 09:44:19 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A4244603E0;
	Thu,  2 Jul 2026 09:44:18 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <64546a50-5593-4083-aaa7-6f772f8c81b5@leemhuis.info>
Date: Thu, 2 Jul 2026 09:44:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] linux-firmware-amdgpu 20260622 prevents clean poweroff on
 AMD RX 6800
List-Id: <linux-firmware.lore.kernel.org>
To: IT4roundtheW0rd <IT4roundtheW0rd@protonmail.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
References: 
 <q7ZKOKwwFDcWVkxZpaMuCo3xjbQ0XzrMZfuVec--VZXX94D5vdqLIRMR6xMaoGI27_uGJ-ILsWrXlXwbfGLf2ozY5bz8QV0Al3JUH7y3f4o=@protonmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
In-Reply-To: 
 <q7ZKOKwwFDcWVkxZpaMuCo3xjbQ0XzrMZfuVec--VZXX94D5vdqLIRMR6xMaoGI27_uGJ-ILsWrXlXwbfGLf2ozY5bz8QV0Al3JUH7y3f4o=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178297825897.3306651.13862513967389606757@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A4244603E0
X-NC-CID: WQUHJuKIRcozFvv2yzdqCWxTh1SrywKG3JrO4uvjTbwvR5T3U8o=

[adding a few people to the CC]

On 6/27/26 02:42, IT4roundtheW0rd wrote:
> 
> I'd like to report a regression in linux-firmware-amdgpu introduced with
> the 20260622 release.
> 
> *System:*
> - Distro: CachyOS
> - Kernel: 7.1.1-2-cachyos
> - GPU: AMD RX 6800-series
> - Bootloader: GRUB
> 
> *Problem:*
> After updating linux-firmware-amdgpu from 1:20260519-1 to 1:20260622-1,
> the system no longer shuts down completely when running `poweroff`.
> Fans, keyboard LEDs, and power button LED remain active after the
> shutdown sequence. The system hangs after "Sending SIGTERM to remaining
> processes..." and never reaches full power-off (ACPI *S5).*

A few questions:

* Which firmware files does your GPU use exactly (a full dmesg log
should answer this)
* Does the problem happen with a vanilla kernel as well (it most likely
will, but would be good to confirm, as heavily patched vendor kernels
can lead to all sort of issues).

Ciao, Thorsten

> *Relevant log excerpt (journalctl -b -1):*
> 
>     Jun 27 02:04:14 cachyos systemd-shutdown[1]: Sending SIGTERM to
> remaining processes...
> 
> (no further entries — system hangs here)
> 
> *Workaround:*
> Downgrading to linux-firmware-amdgpu 1:20260519-1 resolves the issue
> completely.
> 
> *Steps to reproduce:*
> 1. Update linux-firmware-amdgpu to 1:20260622-1
> 2. Run `poweroff`
> 3. System hangs — power is not cut
> 
> *Additional notes:*
> The root cause appears to be that the new firmware blob prevents the
> amdgpu driver from cleanly releasing the GPU before the ACPI S5 power
> state transition. No other packages were updated in the same transaction
> that could explain this behavior.
> 
> This issue was researched and this report was drafted with the
> assistance of Claude (Anthropic AI).
> 
> Best regards,
> 
> Benjamin Maas 

