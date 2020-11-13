Return-Path: <SRS0=aQka=ET=gmail.com=jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6854C61DD8
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Nov 2020 15:19:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8085322249; Fri, 13 Nov 2020 15:19:20 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346BE2223C
	for <linux-firmware@kernel.org>; Fri, 13 Nov 2020 15:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQGBaBOS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346BE2223C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jwboyer@gmail.com
Received: by mail-io1-f41.google.com with SMTP id i18so8631431ioa.3
        for <linux-firmware@kernel.org>; Fri, 13 Nov 2020 07:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bqRrT6n4Vt1rS9HMAlB35cwH9rz6tcyPRQ27xyoMdUQ=;
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
        b=TBpJ3GmjWN38Fb+vTn1D5yNANxW9WOes4OBx6E8DycB5U4WXlXShnYaN1w3yiI0z9L
         oy9/3LZiOC+h3qVPKCPS2S/tgWipOd1oxnIbvIcXLf4Ar9lWG9VbQnMHEt780g8bdQdI
         e2HIUXPB4zA8aFG22HvUror+2hG+9cJuML4DTdi0IK2BjbwcWjApYKi87SmgSfULVtMD
         wkk6SrP3lsXrKozoYtSWB+JQHH9JZxcKkLeJJlLeijqpy26D+m0XgSG9RbSkTRlFSg1/
         0HNrHCubjgpCuSBvP+RiD4FoIn29MFq95Aw1PhWe3sHV/+ZcpCf2w9a98Qj7NatvFBO+
         JsJw==
X-Gm-Message-State: AOAM533QF0LAtuidNcCECfRDKK1Bf91xKYEiKXbsYJQhrfHnYMUDtaMe
	Ji3aQtr7pC1zONz04jCVtC1xuAHsKkUOi4nV62E=
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
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mauro Carvalho Chehab <mchehab@infradead.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media-owner@vger.kernel.org, 
	vgarodia@codeaurora.org, dikshita@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20201113151905.txBd4jDmzQwOqHAjC0eOdehTCk2SaWRCUhEHvPzl0wE@z>

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
