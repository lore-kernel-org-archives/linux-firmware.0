Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFD1C388F9
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Nov 2020 11:29:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 887B3246F2; Thu, 19 Nov 2020 11:29:47 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5BE6D246F1
	for <linux-firmware@kernel.org>; Thu, 19 Nov 2020 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605785387;
	bh=UqxRK9f7qLEi/770YpvC4BXZx2eEE4aOkdInC6BfFpI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=A6GSBd6TdX4g3Zr9z3DMU7bnAMllmJxOev0b++TBWWYVUyg1iyCQlfhbax6iOwWyo
	 LCbDw1+4wVuk52OIgjJ5ThT5lKXWWXzV4JSBApE7EK+X6ob+VpRiQQsAdg673lBTwM
	 avs/HKEbHYarmSD+xjP3/cf1Cd0vbPMswfgQq2vQ=
Received: by mail-il1-f174.google.com with SMTP id l12so5060469ilo.1
        for <linux-firmware@kernel.org>; Thu, 19 Nov 2020 03:29:47 -0800 (PST)
X-Gm-Message-State: AOAM533nO+tLtECi3KA5vDZ02aPU0DMgu35Gxx4Qcslg5GX1fP+5yoaC
	fbI4Fqy8Fgz7KvrbT1xqexs9V8t9dU7jcxrNI10=
X-Google-Smtp-Source: ABdhPJzpQDZq/1/eT4xN8DCi3awniAelI9QkBaylFHHkZBVN7rZhdGn6ytFuXa1UbOmntY3CIJ/P3e5UiYVSrriNrsA=
X-Received: by 2002:a92:155b:: with SMTP id v88mr244377ilk.303.1605785386403;
 Thu, 19 Nov 2020 03:29:46 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_NeOPVjq7Q1d-sWVuwOrNUbE4F1pxqR6FnCJJregv_uog@mail.gmail.com>
In-Reply-To: <CADnq5_NeOPVjq7Q1d-sWVuwOrNUbE4F1pxqR6FnCJJregv_uog@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 19 Nov 2020 06:29:35 -0500
X-Gmail-Original-Message-ID: <CA+5PVA63Ywoy+3G-8iLZst4oLNBKt0Tn40yBs__kU+YOHKjWKg@mail.gmail.com>
Message-ID: <CA+5PVA63Ywoy+3G-8iLZst4oLNBKt0Tn40yBs__kU+YOHKjWKg@mail.gmail.com>
Subject: Re: updated amdgpu firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

You had a typo in the WHENCE entries (missing the 'h' in cichlid) in
the last patch that caused this error:

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: amdgpu/sienna_ciclid_ce.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_dmcub.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_me.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_mec.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_mec2.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_pfp.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_rlc.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_sdma.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_smc.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_sos.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_ta.bin listed in WHENCE does not exist
E: amdgpu/sienna_ciclid_vcn.bin listed in WHENCE does not exist
E: amdgpu/sienna_cichlid_ce.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_dmcub.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_me.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_mec.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_mec2.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_pfp.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_rlc.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_sdma.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_smc.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_sos.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_ta.bin not listed in WHENCE
E: amdgpu/sienna_cichlid_vcn.bin not listed in WHENCE
[jwboyer@vader linux-firmware]$

but I just fixed it in-place.

josh

On Wed, Nov 18, 2020 at 10:00 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated amdgpu firmware for 20.45.  Please apply!
>
> Thanks,
>
> Alex
