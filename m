Return-Path: <SRS0=XLOU=S4=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C3CE64A82
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Dec 2024 11:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 534C9C4CED6; Tue,  3 Dec 2024 11:44:32 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F226EC4CECF
	for <linux-firmware@kernel.org>; Tue,  3 Dec 2024 11:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F226EC4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ef7c9e9592so32058707b3.1
        for <linux-firmware@kernel.org>; Tue, 03 Dec 2024 03:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733226269; x=1733831069; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xqqgHl+63x57bDs4SkHQb48C1LVbibpkZYhxKRVpblU=;
        b=KL+THS7kZHZHyXD6DzUQly/FmLL8mksOrNxQu+uIINonmpxku4Td4NzBBM0JDQVb60
         goXLzeHzzPpeoacdfn1IBTY3fegiLmmNh3HUZQVSkpSg1VgdU1/l1X8SIildaSC12yAA
         7vd1RrWnrHyyxQCPBAP8O13OERfeXl4kQs7w3DylC4lBwmY/0GuaAmmEZtwzxaThALB8
         IIJJN+rZVN2Z3SvxWXmrn4hMP7NO7rlyKeVrgOy7ZCURCRf6R4Rkk0GgvWhvfd2d30Uc
         bpDN8YAUySs/ty2JoExR4eF8qJGHXe/VXsn7v1ZKjLe9bB52lZApNRIXkEcgxl1Wv+OV
         claw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226269; x=1733831069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqqgHl+63x57bDs4SkHQb48C1LVbibpkZYhxKRVpblU=;
        b=wokmUDMfHU1+Me+mgZiUoTo680aVIRU1zpeLCqfiVJ8VEZ+VatFnu8UrUHB9GTLTfb
         aygKURrwQLEYjJ+lTc6VW+3QhrrXOyYRCsADsE59kYpSz95YJILoIFRnMf8s+EYo6ZRT
         ER7SaOFUNJVZCMwIPTdhsgBG//C11F1AlYx5eRmmd74hhWJMONtcs3dROCdu0VOKjqM6
         nzEwnJwg5UQkOQXTQi2la6kHAeR4NSkwLMGG0BnJGAeJARKvYa733MXD3dg10gT4o94x
         z7fSP6VfzNOm+WujkQkHxmn+VW/iAptuRCttyagrRHmyH1+IOKg/Whw+IFAzVrLHcT7N
         xLVQ==
X-Gm-Message-State: AOJu0YwDp8i1UXR1IRwK+mBmN8oVG1GvFPm+pKSeCnV5ZoFFwD1LCRfL
	0eQG+zU8XX2LPZuOvDRrj8xuPPEE7sQcpoDZLRyx7wROZ6x2uNXNsfIFp3AxGS2DH//DMXJOL8d
	A2+JeNNqh7OgzAXN10GypUAOtDnVXECOp9vLzTWbPQM+Vf2Jx
X-Gm-Gg: ASbGncv/lCI5TbJ/R5kI82G/mpkCMzQupeN+nHBPhfUhXvc4DItALfTNtnXUYnPqULb
	fsWPI8NgS2p2Iyes0qJw1XViHQpRAgA==
X-Google-Smtp-Source: AGHT+IHCteqUdDiNNWhelGJiB9W9TOaAZt2OzWJgx83I8bZ84MK6MuES1PxGZrB9Irwbvfi2vsLjnCinSuem48MG6Mo=
X-Received: by 2002:a05:6902:2292:b0:e38:99df:5406 with SMTP id
 3f1490d57ef6-e39d43791c4mr1708156276.40.1733226268984; Tue, 03 Dec 2024
 03:44:28 -0800 (PST)
MIME-Version: 1.0
References: <5cb9ed4a-2c4e-4f6a-9277-840c25bc24c6@quicinc.com>
 <cq2po7zw46nryv4lzdopfqv6dut632ax6c4ezcqbrf4w7qsdi3@cedllayr7nlb> <e2c2a813-1884-4fd8-873d-5445be472712@quicinc.com>
In-Reply-To: <e2c2a813-1884-4fd8-873d-5445be472712@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Dec 2024 13:44:21 +0200
Message-ID: <CAA8EJpqOCUQEVfx8DnDRq+91+SnASxtpmxoBuRGX1MBwpW+Uaw@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth WCN785x firmware to 2.0.0-00515-2
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 04:23, quic_zijuhu <quic_zijuhu@quicinc.com> wrote:
>
> On 12/2/2024 6:17 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 05:31:32PM +0800, quic_zijuhu wrote:
> >> Hi linux-firmware maintainers,
> >>
> >> Here's a pull request for btqca bluetooth driver. Please let me know if
> >> you have any problems.
> >>
> >> The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a7943:
> >>
> >>   Merge branch 'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19
> >> +0000)
> >>
> >> are available in the git repository at:
> >>
> >>   https://github.com/zijun-hu/qca_btfw
> >>
> >> for you to fetch changes up to 7f116580d9060feaedaed55eb65c63eeba59341f:
> >>
> >>   QCA: Add Bluetooth nvm files for WCN785x (2024-12-02 17:05:12 +0800)
> >>
> >> ----------------------------------------------------------------
> >> Zijun Hu (2):
> >>       QCA: Update Bluetooth WCN785x firmware to 2.0.0-00515-2
> >>       QCA: Add Bluetooth nvm files for WCN785x
> >
> > Are new / updated files covered by LICENSE.QualcommAtheros_ath10k or by
> > LICENSE.qcom?
> >
>
> LICENSE.QualcommAtheros_ath10k as marked by WHENCE.
>
> for firmware updates and adding NVMs for existing PATCH files, we would
> like to follow existing licenses.

Thank you for the confirmation!


-- 
With best wishes
Dmitry
