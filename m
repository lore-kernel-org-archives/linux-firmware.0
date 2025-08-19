Return-Path: <SRS0=lz8g=27=ionos.com=jinpu.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DF2CA0EE6
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Aug 2025 06:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35F9CC113CF; Tue, 19 Aug 2025 06:15:05 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63AA8C4CEF4
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 06:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63AA8C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso198174a12.0
        for <linux-firmware@kernel.org>; Mon, 18 Aug 2025 23:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1755584102; x=1756188902; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vsvobzyd+pWIGRqDH6FmhjP2NbQY9Nu/5YdKYy+n1fE=;
        b=BwhClhkcABrAW7iEvLEbId6qfYuVRkG+pI1fwQVU9ItABaHK+6ruUzYIR9XR7gGDm9
         E+yfXlc17ndmR/ICaR6kObJ07ynwzsKNqOS18wv2jysHFG9PZ3bGIuaQToYWxxrV5fmz
         aDE1eBMTkSnUetDe13ekFJhIwZZ9XcoQB1OVYbaZJuXWEuN2u9T6dZpjorXYzbat+i2Q
         w8GNNXgk48mw6+vh00Zf/3E92gnCMXaLdYljiP7gUJcqRkiRAIQIAbQfyedHBH7YPSfd
         6ggHLecYSZ7980QezERYXpE/xU77BsTOqOFN0J2q1HhxZmQL4+7eKC0kDcv6yiGDk5v+
         56qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755584102; x=1756188902;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vsvobzyd+pWIGRqDH6FmhjP2NbQY9Nu/5YdKYy+n1fE=;
        b=Go0EXbFMhTUtGKjcgC0klgppcMIMCP6OOda2gSIwaFqWQkO0scKfwiWh/OXA1B2ZLk
         AYdnOgrccmJ0BO7M54oCd9rk++1/1xzX+0xuyx8paWUMhnGXviuvYwmMHMZn0FhNGUyf
         m/ghj9MWYm1pAC8hsgr2KqusHZkTemHzpf516RH2GSkRvH2Y1lTZOsAn0nVkWiZ1nuXm
         sLBBGz3WIkfdewiO/PHxzZpC6PFuigtzzj9DyAKh8vukQtzj4geJK4f1r19X7FgbvUPK
         uifmuBbhZ81f1ZagXc+dGLwS1ljlXWLu1yJYBNWKGFJywr6UxSALx1jvgiaG/ELTLnea
         O3vg==
X-Gm-Message-State: AOJu0YxoZ6HTBPb1rugn7hnCFRjHxOpTDD7kSadqjRNneWhKxuzdTHmy
	ChsOH0HcZ2S4E1iWrpAi7r58kTqds0tPy40f3eKI/QPw/0tRGIfQPYSY7zcYz/hA2347rYm+JDh
	jgTUhd11Ql/80pv/ydSnPjJpH6dyCge+WTFmXmAakJzkiSiJtT2pT4Po=
X-Gm-Gg: ASbGncsB0KUf7GvnFNELFVNUYXJkQpzsSC4CMc+npH9P1SxKz0JsqG0rbdEFtd3MCD0
	RLohkgGCNHR/4y9J7VtpH0G5YH7B/jfrJgm3ykZHjMieSM0sZ8EPvdqCcZAaBDcjoCaEVfogF5X
	oKsleWohWp2t1dtKy35T6uq+4xc05RUaWrUykPYgcUqo9lc2ZPpVz2vnL0qPqM1+HTul410Q2+z
	/XJUsxjZFKdWPHV/IbWi2kH/0+X9sYVP7zg5Qz8
X-Google-Smtp-Source: AGHT+IF60qmQBNGeuGMzeBotisgEDbW7PjNxj5396q9ryZKwWzXVpap9pJfjv+PyBl7UsTNLGVMAKw9ukmWer7/vSv4=
X-Received: by 2002:a05:6402:4407:b0:615:d492:5bf3 with SMTP id
 4fb4d7f45d1cf-61a7e754f7emr553281a12.6.1755584101577; Mon, 18 Aug 2025
 23:15:01 -0700 (PDT)
MIME-Version: 1.0
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Tue, 19 Aug 2025 08:14:50 +0200
X-Gm-Features: Ac12FXw85l4E2Qzdz4eZU-25DlZgTxIbtrb7-5QJx5Gc3_Ih2bUSGVXILRmFHlg
Message-ID: <CAMGffEmFm8wvgiw+s0ZpOhRxBLOz3dQiS=sQCkgJLD6qC3VwJg@mail.gmail.com>
Subject: [BUG] amd-ucode 20250808: "No sha256 digest for patch ID: 0xa0011de"
 on Linux 6.12.37
To: x86@kernel.org, Borislav Petkov <bp@alien8.de>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I am currently testing the latest `amd-ucode` from `linux-firmware
20250808` and encountering an early microcode load error on Linux
6.12.37. The CPU is an AMD EPYC 7713P 64-Core Processor (Milan, Zen
3).

Upon boot, the following error is reported in dmesg:
`microcode: No sha256 digest for patch ID: 0xa0011de found`

When I use the kernel parameter `microcode.amd_sha_check=off`, I
receive the following errors:

```
jwang@ps406a-1.stg2:~$ dmesg | grep micro
[ 0.000000] microcode: It is a very very bad idea to disable the blobs
SHA check\!
[ 0.000000] unchecked MSR access error: WRMSR to 0xc0010020 (tried to
write 0xffff888034ce5fd2) at rIP: 0xffffffff90064eeb
(__apply_microcode_amd+0x3b/0x90)
[ 0.000000] Command line:
BOOT_IMAGE=(http)/live-images/liveboot-k6.12-test-2025.450/vmlinuz
BOOTIF=58:a2:e1:b1:82:60 boot=live
fetch=http://mgmt/live-images/liveboot-k6.12-test-2025.450/root.squashfs
consoleblank=0 PHASE=Testing crashkernel=512M quiet
salt-master=stg-salt2.stg.profitbricks.net saltenv=base pillarenv=base
microcode.amd_sha_check=off liveboot.roce retbleed=off amd_iommu=off
intel_iommu=off iommu=soft
[ 0.018728] Kernel command line:
BOOT_IMAGE=(http)/live-images/liveboot-k6.12-test-2025.450/vmlinuz
BOOTIF=58:a2:e1:b1:82:60 boot=live
fetch=http://mgmt/live-images/liveboot-k6.12-test-2025.450/root.squashfs
consoleblank=0 PHASE=Testing crashkernel=512M quiet
salt-master=stg-salt2.stg.profitbricks.net saltenv=base pillarenv=base
microcode.amd_sha_check=off liveboot.roce retbleed=off amd_iommu=off
intel_iommu=off iommu=soft
[ 0.143803] Transient Scheduler Attacks: Vulnerable: Clear CPU buffers
attempted, no microcode
[ 0.014489] microcode: CPU1: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU2: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU3: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU4: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU5: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU6: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU7: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU8: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU9: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU10: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU11: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU12: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU13: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU14: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU15: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU16: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU17: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU18: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU19: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU20: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU21: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU22: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU23: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU24: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU25: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU26: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU27: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU28: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU29: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU30: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU31: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU32: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU33: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU34: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU35: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU36: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU37: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU38: update failed for patch_level=0x0a0011de
[ 0.014489] microcode: CPU39: update failed for patch_level=0x0a0011de
[ 0.01
```
Seems we have to patch arch/x86/kernel/cpu/microcode/amd_shas.c for
the new patch 0x0a0011de?

Thx!
Jinpu Wang
