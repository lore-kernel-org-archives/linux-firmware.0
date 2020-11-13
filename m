Return-Path: <SRS0=AU6j=ET=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57771C388F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2020 15:20:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E98742223C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2020 15:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MN5162xK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQGBaBOS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E98742223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PBPfkxUo4ogIKf6LER3NGDAlGSJIbTepFEeGnP1YNLs=; b=MN5162xKDlVFi44EsYTNDo63M
	nG1gUU8K3J2eyiTgQnArTkcvnZ/tjn1/dPS/2T0xktuDeamVSH5Z7aPA/kVUCVCLZax4ykc3pi4Zr
	2/cnXH0knh4gOGdQWtEzBEM5tXaOIm5634kee/MvnLBSAGpa/CK7eGrrbwPF6dFeg4+HARtp3ad0j
	IC82NX/TMLLwVglIIM5jrOXKBvUTeXmRgX3r8w0m1S/ty18UnH278ypW2N84rWekcdwDCfHcn+Idt
	W3H0P211spI43/fAxs6Xsh2GZ6rgG44N32CZrw4/dUtIVfuKSOTya1Nwtx0dhVvJIh4ZGrlTKtNOl
	Y73WZ9V5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdarG-0001AV-R8; Fri, 13 Nov 2020 15:19:26 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdarE-00019W-5m
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Nov 2020 15:19:25 +0000
Received: by mail-io1-xd2f.google.com with SMTP id s10so10138279ioe.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Nov 2020 07:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqRrT6n4Vt1rS9HMAlB35cwH9rz6tcyPRQ27xyoMdUQ=;
 b=XQGBaBOSBVueXzyy7FaPrYWdq0ubcfRoz7ooPOP3IY0J25h/knA7nN0MRWA63MOsB8
 QeqS6PfZft0QkNHlRByM0djLMXG/8NLDrHTHL0ik9wx0jhD2JuCiCT1hmH03CwqDkdY/
 XvrFAPFStX265jOxEAVijm1w8nxdUYaZo7FUk5U7uo1p2PJWevYSsoZmHmzIuyhm5Zpd
 K9TS87ZPq1mibZpT9ZbmQJltnqoA+MWqByjDJA6oMePcbzd1gGB+bj35Baj/Qwg5Nz11
 xUYcPsumR+fBIM7yzUQrBij7X4oG1iCwM/mkvZxBKk/3+PB6znn2QpicwBTOezF3BlxF
 7VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqRrT6n4Vt1rS9HMAlB35cwH9rz6tcyPRQ27xyoMdUQ=;
 b=N82bqbpUbaLgbMlkmr4PtnVjtm/ux/r/OIEJjoOt/VKoJ2gbGjCVrX7xelaJSkIrPx
 5UVPh81PQm5JJ1H0evv0pEwOnlfimAD1QtmDbMHI2UJawpL7tMQXAA2+V0Wrw6DVLjq4
 6hGYG+dJMJj6L5NyQfaiPfk1A2GTP2JF0iAC6JSDsz9PHGX/2fHeLuyP4WUee7+094cc
 yc69GeEZn7rioZ/rVqiPJRRn/LpMaCV3YpviSDpg1vjl/pj0iP4q++l5HgNhObR9inu+
 mTa2AxXGjX8G9WQFPBFQLkB/9/hZWbLU/FACB8DlqM1D5GPiM86sVryv3ZYZMVtiE5G5
 BQlw==
X-Gm-Message-State: AOAM533gs4Yu0VWLGltjq2CYNLOPOgSICKfnQUSIHSdnEBSYCfnDc9kU
 GLkCrlPpSkN2jKCVqwGSnkfag/njAo2kUvtfWX4=
X-Google-Smtp-Source: ABdhPJxELH4sk5PYBwRPvCMwn4LRdM8KnpuDJ+4GNlMXPaICm/hjFKFxDXitRZ3K4SAEsvuj64lghL1DAcr7a8/Sl4w=
X-Received: by 2002:a6b:f816:: with SMTP id o22mr189015ioh.101.1605280756142; 
 Fri, 13 Nov 2020 07:19:16 -0800 (PST)
MIME-Version: 1.0
References: <c1bcb5eedc160e99d65576d431816a41@codeaurora.org>
In-Reply-To: <c1bcb5eedc160e99d65576d431816a41@codeaurora.org>
From: Josh Boyer <jwboyer@gmail.com>
Date: Fri, 13 Nov 2020 10:19:05 -0500
Message-ID: <CA+5PVA5eWkyWuG6ehcfsO=h_LSOzyOpdB_d3=y0O6m+jeeobEg@mail.gmail.com>
Subject: Re: Update venus firmware files for v5.4
To: asitshah@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_101924_240259_8C2DEFCD 
X-CRM114-Status: GOOD (  17.38  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <linux-firmware.lore.kernel.org>
Cc: dikshita@codeaurora.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Linux Firmware <linux-firmware@kernel.org>, linux-media-owner@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, vgarodia@codeaurora.org,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201113151905.OTq88AWnBeXdRP09p8mAJH9_4LGWnoANGrw6d8HiJHc@z>

Pulled and pushed out.

josh

On Fri, Nov 6, 2020 at 12:10 AM <asitshah@codeaurora.org> wrote:
>
> Hi Team,
>
> Please include updated Venus Firmware bins for v5.4.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
> >>>>>>
>
> The following changes since commit
> dae4b4cd084102cd49c37aa8b579b208028ab025:
>
>    Merge branch 'v1.1.5' of
> https://github.com/irui-wang/linux_fw_vpu_v1.1.5 into main (2020-10-23
> 08:10:37 -0400)
>
> are available in the git repository at:
>
>    https://github.com/shahasit/video-linux-firmware/tree/master
>
> for you to fetch changes up to 8a46c32a26b3f22835543b158877aa0b0e01e8d6:
>
>    qcom : updated venus firmware files for v5.4 (2020-11-06 10:33:37
> +0530)
>
> ----------------------------------------------------------------
> Asit Shah (1):
>        qcom : updated venus firmware files for v5.4
>
>   qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>   qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>   qcom/venus-5.4/venus.b02 | Bin 873100 -> 873680 bytes
>   qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>   qcom/venus-5.4/venus.mbn | Bin 919212 -> 919792 bytes
>   qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>   6 files changed, 0 insertions(+), 0 deletions(-)
>
> <<<<<<
>
> Regards,
> Asit

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
