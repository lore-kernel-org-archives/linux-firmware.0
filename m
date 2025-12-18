Return-Path: <SRS0=ZZmQ=6Y=ucsb.edu=aled@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89E3D6E2DC
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Dec 2025 20:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F8BEC113D0; Thu, 18 Dec 2025 20:00:29 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E25FC4CEFB
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 20:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E25FC4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ucsb.edu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ucsb.edu
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-657c68a08a7so544199eaf.1
        for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 12:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucsb.edu; s=google; t=1766088027; x=1766692827; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kO3OpkcDcEx6V1H+kEgWcVfzuHYLE2LalE4LMQU3/PE=;
        b=EMaAbXHIEavUux/aV1RDrJC03xbX0sa9aQB+SDrU4z/8OnskFJPhk/mBkz6/z3kGP5
         Gmwpqx8suDcrysGzfJwLJ9ZLsfX54/88b9r7GNBtDQmJKcW23FcduWjyL7uuhCHCiB8v
         oFoUTNBxVUtfDi6Wt1AgFb48wswK3ZX6gwAyMhkP/jo8btnuaJakFiXHNmVaHb2L4Jqd
         YAXRQEM9xsKRUAohbdP/DPVR4Ju+LZe3hSl2kV192Qx6Xfjgju5B/rqdaH2Ss1jLC878
         eh28brhPyrKEhHCKnXOMSbCJGtQyvzkSCUUA0JHgwEA+tAFFtCu9DkzwVmhcb4ukFwyY
         L3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766088027; x=1766692827;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kO3OpkcDcEx6V1H+kEgWcVfzuHYLE2LalE4LMQU3/PE=;
        b=Msn7KN67z26PfA+hVVo2JMdLyAOnHNdghMNQQkxbkHBSlaK/JTmqRLKbzfbPBHgHnp
         F8tEGhhQduCoMM7pmfLqMMtQDuFAX3zR3T4XhdU5W7S5jrYaBS2kbL1my3PvpTBLNa6m
         9S/pkQ1cMKaGJXwrYiKq9vFHh0siwzzEKvQQmgPvOQc9yrAj1d2dKU77Hwzx6preAJoA
         bmTgKwvGpKKkQPXHhEFG403YTGymJnmgsgbgGpLmhdp9ldJx2OZmeuEdb3T2RtD+QA6l
         EoBj/to2P7yoiqqAuLqTyWg8KZbfJjGo7z1/0b9jPXWC7TW6a/dG/U7mszUjp6HUAH0E
         KZ4A==
X-Gm-Message-State: AOJu0YwxOwxc9w0g5qqYjdws33IM0AFORXR7INV9FYwqRqo3TZtD74kT
	MRtoJmMIVRXZdgT97uW8HnHcI7h2y5TM1PhvzvjU4GU3phbd+MaLyPfaIF6l8lsH+cHMcR5cvut
	R1Xb04Dp+FJXvDr6rkmMxoVSg+dPEig0RnvS6SZNxapDyHmu1sUeuXm4=
X-Gm-Gg: AY/fxX4nD/FBsOFdKCq/eOmV0vqRJHF8a8Qq6BwMwMZvwisLX0S3UDhIOQZ+I4C5ZFf
	Fe7rI9cXdBJ/xqLfexgG6bpoQSsnwogyQ/5N0OtDJ58Mj+fuakYKWZUBWIwh2bidJfp0a6AilXi
	9OQXRdhUHC/fzVe7L923LypBF9mJzLT226X0gT3YI+sNTMJzzT2f6OwPYLGPBSsrRsodxnrihrg
	WCoTKHv7R/sYKuGEQQ+pctThV/t3ppJmDUqzPavV8ihndYh7vFKszy9cu6+DCEaRylFFrSGo99Y
	hdqHL2JqmFPtMdMQDQc0OLChhlU=
X-Google-Smtp-Source: AGHT+IEgDhF25E4Du09uUp82YLo/93hhtyCVpv+qj5hAf9mWCo0/pmdGh3wYfl2nLA6GlyPnqMZQMBFH8Q1KfFpALTg=
X-Received: by 2002:a05:6820:1504:b0:65c:f9c1:cb99 with SMTP id
 006d021491bc7-65d0eab98c3mr301554eaf.54.1766088026986; Thu, 18 Dec 2025
 12:00:26 -0800 (PST)
MIME-Version: 1.0
From: Aled Cuda <aled@ucsb.edu>
Date: Thu, 18 Dec 2025 12:00:15 -0800
X-Gm-Features: AQt7F2oWZfYWoPZ_g27jkduUyePlBCn-XZwnI2sphKGREShf0nHsw4AIRIVLlXY
Message-ID: <CAGctGbQVHN+XuFOzGf7029mfM0vAjDTPpbYmPDJxnLsai9ON5w@mail.gmail.com>
Subject: [PATCH 1/1] zynqmp_power: Add ZynqMP PMU FW binary
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

Firmware is MIT licensed and is common to all SoC revisions. Board
specific config is built and loaded by u-boot. Built from the 2025.2
embedded software release.

This needs to be loaded for basically anything to work with the
zynqmp_power driver.

This is a large patch because of, ironically, the license file which I
have replicated wholesale from the xilinx embedded software repo, so
the patch is available as a gist here:
https://gist.githubusercontent.com/ld-cd/546a914c0a2437ba8928fa9f6d976df3/raw/fbfef284176f491fbe96594b5a1138f1ef954c2f/zynqmp_pmufw.patch

If paring it down to just what is linked into the final binary is
acceptable I can make an attempt to trace that out.

MR on gitlab is here:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/833#b91f3092d937ee2b2dd591aec3844d7efdfcfc26

Signed-off-by: Aled Cuda aled@ucsb.edu
