Return-Path: <SRS0=RNxq=D6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B81C55178
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2020 11:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD95020EDD
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2020 11:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qt3HGB6m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD95020EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3066E504;
	Fri, 23 Oct 2020 11:58:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEEB6E504
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 11:58:36 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C6DF24631
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 11:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603454316;
 bh=xu6ztFg5IBpO5cVaGxm2D9PYP4Ip/ZYqM71qJsQCWd4=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=Qt3HGB6moIuSuLVF4dz5AIHv57m1lQ2QIZf+cJsUAVY8u6O6agQnI6XEP0GtnqDuD
 Adrfmh57y5ppEJ9SYl1uJEbvFXjsLvWwobaP8XTFGKYOtEW9FQEvybpfhRhxDB91fB
 VCaxyOtpHuNAZUD2945mTzuwYJPbIJ2MLEhFDOFw=
Received: by mail-il1-f171.google.com with SMTP id p9so1102353ilr.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 04:58:36 -0700 (PDT)
X-Gm-Message-State: AOAM533VKy3zb6bJ0YYmIed3SsSp4q5awJVGsyeVgKANMfVVMfntZI6B
 3WhTkatOl+HFS8wR5kAA4mYep4WcV5dTbe89o6g=
X-Google-Smtp-Source: ABdhPJy05gNx/02KcDt4JoV7BlP9meLBkYJMyx3sqQOG33rZybJrPMfaBsTtS1J/tlXAygvs2OD7hv5NI/PELJfGVfI=
X-Received: by 2002:a92:600e:: with SMTP id u14mr1289210ilb.303.1603454315751; 
 Fri, 23 Oct 2020 04:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <3997663f047e4ab68fca41e3c8a05671@intel.com>
In-Reply-To: <3997663f047e4ab68fca41e3c8a05671@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Oct 2020 07:58:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4tEqub_1KmA9WeRa3WZ4OpDejdBn2FDxZ-LESfFD1Vnw@mail.gmail.com>
Message-ID: <CA+5PVA4tEqub_1KmA9WeRa3WZ4OpDejdBn2FDxZ-LESfFD1Vnw@mail.gmail.com>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] i915 Update : DG1 DMC
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "ben@decadent.org.uk" <ben@decadent.org.uk>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
Message-ID: <20201023115824.XQqLYzYZqPzhMuK4qtLAV9049xkqzGKJONRZXTBW8-Y@z>

Pulled and pushed out.

josh

On Fri, Oct 9, 2020 at 2:41 PM Srivatsa, Anusha
<anusha.srivatsa@intel.com> wrote:
>
> Hi Kyle, Ben,
>
>
>
> Please add the i915 updates to linux-firmware from branch dg1_dmc_v2_02
>
>
>
> The following changes since commit 58d41d0facca2478d3e45f6321224361519aee96:
>
>
>
>   ice: Add comms package file for Intel E800 series driver (2020-10-05 08:09:03 -0400)
>
>
>
> are available in the Git repository at: dg1_dmc_v2_02
>
>
>
>   git://anongit.freedesktop.org/drm/drm-firmware dg1_dmc_v2_02
>
>
>
> for you to fetch changes up to a140ef3eb3746aba2c897db16e02ffb5ffa9e7a2:
>
>
>
>   i915: Add DG1 DMC v2.02 (2020-10-08 12:13:33 -0700)
>
>
>
> ----------------------------------------------------------------
>
> Anusha Srivatsa (1):
>
>       i915: Add DG1 DMC v2.02
>
>
>
> WHENCE                   |   2 ++
>
> i915/dg1_dmc_ver2_02.bin | Bin 0 -> 16624 bytes
>
> 2 files changed, 2 insertions(+)
>
> create mode 100644 i915/dg1_dmc_ver2_02.bin
>
>
>
> Thanks,
>
> Anusha
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
