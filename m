Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E449DC433E1
	for <linux-firmware@archiver.kernel.org>; Sat, 22 Aug 2020 02:58:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C84A320855; Sat, 22 Aug 2020 02:58:32 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ABD3920732
	for <linux-firmware@kernel.org>; Sat, 22 Aug 2020 02:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598065112;
	bh=KfvHObarW9xbXudcCQmkw5i85PqZm65XD0+aYgdk03Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=X7C+lG4nvoE60FpGJU/lYkq69dVC36rVktM3aOevThPzNjbiyOJ99Luu2YvKvGZAf
	 1B1RR7tW9EJTAHDLgb0v2PP1gS7oMSHA1XQUJ03K1Q8lCwjkgXmPrMCKgkwc1kFkYn
	 jeFx8NS8jfCq82mKvLS0ClzZp19f2GdG5vj7978M=
Received: by mail-il1-f176.google.com with SMTP id t4so3031816iln.1
        for <linux-firmware@kernel.org>; Fri, 21 Aug 2020 19:58:32 -0700 (PDT)
X-Gm-Message-State: AOAM5305nmJn2PeN6v/DU/7YMEo/tH3vPtYuw2POc4OB+MiGlLNSpYHJ
	szrpkGN0d+qy+Ee7cgIwD6j83CE4hBgKHK0Wu0k=
X-Google-Smtp-Source: ABdhPJy+VCyRWR8CEjsydc3GuTDygZUv0863L5Bu6nGDjBUKMCR/p2Loq8jcbnpM0n0w32iHy00rdenQstvuMT8cfw4=
X-Received: by 2002:a05:6e02:1207:: with SMTP id a7mr4841586ilq.303.1598065112120;
 Fri, 21 Aug 2020 19:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200821211402.2320025-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20200821211402.2320025-1-anthony.l.nguyen@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 21 Aug 2020 22:58:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6-pSVORG9LY4-vWU9NgQvN1OC-7ChXb0p0DAiDH3kDPA@mail.gmail.com>
Message-ID: <CA+5PVA6-pSVORG9LY4-vWU9NgQvN1OC-7ChXb0p0DAiDH3kDPA@mail.gmail.com>
Subject: Re: [linux-firmware][pull request]ice: update package file to 1.3.13.0
To: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, netdev <netdev@vger.kernel.org>, 
	sassmann@redhat.com, poswald@suse.com, 
	Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Aaron Brown <aaron.f.brown@intel.com>
Content-Type: text/plain; charset="UTF-8"

The license submitted with this request is not acceptable.  I am not
pulling this.  I'm not even comfortable replying with the binary patch
quoted, so I've deleted it.

As written, the submitted license requires acceptance that isn't even
possible for an open source distribution user, and forbids anyone from
redistributing it.  It also requires people to agree to an NDA they
have never seen and have no ability to agree to.  I suggest you review
with your team and determine if the original license that allows
redistribution is still suitable.

josh
