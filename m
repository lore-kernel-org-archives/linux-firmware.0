Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFFCC433E0
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Feb 2021 13:01:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8602864E79; Thu, 11 Feb 2021 13:01:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6540A64E95
	for <linux-firmware@kernel.org>; Thu, 11 Feb 2021 13:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613048518;
	bh=GZk7u0XFB+EVEMDl2Jlbrk19MelqMJvGc77xAqE3MDY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=GIjvaDt6CfNfETIcU4OGHHa0VTYFAINZPBNJOQbyo69Te1hFrYo+0Pm7M7no+OWiH
	 2PajwRPF0/jA67EiUrA+X77zSqhSwsyItAQ5EvkiAUPJ8cK+f/L24MCpEYaEX9vbek
	 Zl1sCXez0KklBbFf2HzxBHQzRnB1P4iVJbJAakE7vismLUPbq3SlabRUvbolZD/9ZR
	 R8zuM2BS8HSEc2WdYWtYRGhuR1WyYbDq26ji/qnv5tcsBa4zUDPcVOoX7jvad4pvXG
	 n4Y98K/9W3yXxmq0JOKm82JLa+MfkNsXYZ4QOLhK6UBL9R56gzE59F0Ro4NZGn7iz8
	 9KDRJfn3qQuwg==
Received: by mail-io1-f45.google.com with SMTP id n14so5571506iog.3
        for <linux-firmware@kernel.org>; Thu, 11 Feb 2021 05:01:58 -0800 (PST)
X-Gm-Message-State: AOAM533MF7dF4OmbjN3YSxibPrnZa6bkADq+pFU8ad9PdlEkaNt3x/LM
	6I5flHvMMK+PBPxBJHS/9VXAMWek7GVrqT7tNJY=
X-Google-Smtp-Source: ABdhPJwiSY9NfzMJrrb44vvIpb0vhxf/b+iCRK4nuRt+NkVCgmsapBA05c77LeAq8yFEkpqxLYin5nxFqe3BNGJ9JV4=
X-Received: by 2002:a05:6638:378c:: with SMTP id w12mr8525508jal.107.1613048517908;
 Thu, 11 Feb 2021 05:01:57 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_Mc7A60S2fyqwcJF1i6OB54VvUMo0s0dK5Ghdz8ZGKqDg@mail.gmail.com>
In-Reply-To: <CADnq5_Mc7A60S2fyqwcJF1i6OB54VvUMo0s0dK5Ghdz8ZGKqDg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 11 Feb 2021 08:01:46 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4vU=7WEFie=u35Xjd05MmRBEXpBCiJ=2j2bhDRHypknA@mail.gmail.com>
Message-ID: <CA+5PVA4vU=7WEFie=u35Xjd05MmRBEXpBCiJ=2j2bhDRHypknA@mail.gmail.com>
Subject: Re: Add firmware for new AMD APU
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 11:52 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> This adds firmware for the new AMD APU "green sardine".  Please apply.

This doesn't apply.  It seems your tree still has the typo'd names for
the sienna_cichlid files in WHENCE (missing the h).  I fixed this
upstream directly:

commit 54c797a694d3830ef93f349ec25e1d96d4b88102
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Tue Nov 17 14:32:15 2020 -0500

    amdgpu: add sienna cichlid firmware for 20.45

    From internal git commit:
    5a088517a27d29a7424859cd9b158850a6802f07

    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    [Fixed typo in WHENCE file - Josh Boyer <jwboyer@kernel.org>]
    Signed-off-by: Josh Boyer <jwboyer@kernel.org>

Can you rebase and resubmit?

josh
