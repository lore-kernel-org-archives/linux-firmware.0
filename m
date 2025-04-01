Return-Path: <SRS0=KRjU=WT=gmail.com=samk.threatsecure@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3518FC36010
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Apr 2025 12:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E833C4CEE5; Tue,  1 Apr 2025 12:03:24 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39A55C4CEE4
	for <linux-firmware@kernel.org>; Tue,  1 Apr 2025 12:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39A55C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8f05acc13so61611546d6.2
        for <linux-firmware@kernel.org>; Tue, 01 Apr 2025 05:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743509002; x=1744113802; darn=kernel.org;
        h=mime-version:date:content-transfer-encoding:subject:to:from
         :references:in-reply-to:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeZsCiNq2HaVIEQ5gDf7j8bKg7ea3Eg669EbOzG337s=;
        b=cIaBqHROHeXQLwjB6y9yiNNBA5zgbn5geBTrFi38MI7FbZ1WLQ5rLGpWm/LI4ZlL8v
         QBsIfZ+LlkRM3dkNgTV8AmvL5+2eAlMbCufE82kE1XIy2l7v6zKk1OfoW5U9lZEEZBaG
         f9uhVa2mN2Tp5EsDfmmXveJGS4EFrWSda4MuAh+nsiM/BzRa1QN4Xx2vyHvck432XMKC
         fjCZ4WTf0qxpqRW9VFfvzFvaOccCs5NSK0arS0/trM0mqq6sh/e2E8CjH6ClEPlDC4LR
         w9nPQKGfZanpX+sVsalsrktwdgnmlDf7OiBuwQd2R2UrmlnQcIqCkz/nn+K5JJmsY+5d
         w+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743509002; x=1744113802;
        h=mime-version:date:content-transfer-encoding:subject:to:from
         :references:in-reply-to:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeZsCiNq2HaVIEQ5gDf7j8bKg7ea3Eg669EbOzG337s=;
        b=tUK/EL5SjQuDl0ASxOIivN4mm7nOfvFl8qqevut+orA6IdbNIOcfNUQFWDvp1HvNCA
         u58ISeWZkClk78tE/Y1AhfjziW3FwSgb+ONHNM/xT4yxgDKPzbXe+bQCITqkaB4cudSg
         CG3Nj7IEawapdvpiOiT2jLml4I5YnjJEiLeU5q/6vZxkTntXxonASfttl+mJliMQG/ZL
         5thKudsVVwjo1L7OKwcSxpuNdSRvgBRtUVySfqWlU3BX5iukl+Py3FgiF5WvG999yCQ8
         7269TLJpjCp4fsssyOyekEQP/vkoamPY3YL8hNzPHQFkR9qblEvlKGhucvkI/lfZcfVD
         VGdw==
X-Gm-Message-State: AOJu0Yyq23+WVv43ya9aN7siRL/lks/H1PbMSpowQ0wCaF+ajXTO3bGt
	sUqlaQA0Z0dl91tVZYhjnzSe8Jf7cVb1scTTJlF4IjIwDaCxz4knVgp0t3jo
X-Gm-Gg: ASbGnctqAbO5f/qS3aeXjdVzalqjzr1FB+/PH3qYkEXLnbK7YuhKCmG3iApsYx441Rd
	WgbotOOZWwKbMnGmvtkWfJ7b7OGvQ2Ravm/SYYWVa1gauw8TdWl/m7e0+aWXjv+whNn2jQefrjQ
	QxRCNb4FHjIJPV+2ZGkP/D5nGC+oZLwzzhGT5beDGsl8wNdC6kvVj98bkAUtnOEf2Y19C9CKPj/
	FoiYipbNivYx6ZSzg2lpFfJpoV0TNaq2Kb9+J3qaufY4Tylc2EFI/4gRl+7MAJTYDQ6KwCe/aMs
	HFM4gMED8gX/A2O12Te0IfGIOYsR8Bp10rbrloYx1mmYO72W+jJ3LOudXeQnOIQ85U3NGuJYK8c
	D+S7+mdpMYlt+lBVYXOmriF28BR2qZTG/03vGE07teRrmtyJn3emciLi0E/r/AmFfc8y3EuA=
X-Google-Smtp-Source: AGHT+IHdKrmNFGfWpq/dpJlvFuslQoJKHOjKpIGJC1vGojHf1bQWslQp8ScRVWaeMiftIr+21Cn/pQ==
X-Received: by 2002:a05:6214:5018:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6eed61c7a45mr199717316d6.17.1743509001782;
        Tue, 01 Apr 2025 05:03:21 -0700 (PDT)
Received: from 399e176e-b666-4bea-9c4e-c51426853478.local (ec2-35-171-26-62.compute-1.amazonaws.com. [35.171.26.62])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec97bce80sm61005376d6.123.2025.04.01.05.03.21
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:03:21 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Message-ID: <399e176e-b666-4bea-9c4e-c51426853478@gmail.com>
In-Reply-To: <a26d410b-bd73-4a57-90c8-52492461d5d4@gmail.com>
References: <a26d410b-bd73-4a57-90c8-52492461d5d4@gmail.com>
From: Sam K <samk.threatsecure@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: kernel.org
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Apr 2025 12:03:20 +0000
MIME-Version: 1.0

Hi Team,

Were you able to get my last email?

I can understand that you =
might be busy, which is why I'm reaching out again.

Appreciate it,
Sam

On Fri, March 28, 2025 12:44 PM, Sam K <samk.threatsecure@gmail.com>
[samk.threatsecure@gmail.com]> wrote:

> Hi Team,
>=20
> Just bumping this to the top of your inbox!
>=20
> Looking forward to =
hearing from you.
>=20
> Thanks,
> Sam
> On Wed, March 26, 2025 11:39 AM, =
Sam K <samk.threatsecure@gmail.com>
> [samk.threatsecure@gmail.com]> wrote:
>=20
> > Hi Team,
> >=20
> > I was checking out kernel.org and spotted a =
few things that could make your site a target for cyber attacks.
> >=20
> > Do you have any kind of formal/informal bug bounty or reward program =
for researchers to find and report security issues? If so, please let me =
know, and I'd love to check out the specifics see how I can help.
> >=20
> > If not, please let me know if you=E2=80=99re open to rewarding =
researchers for valid vulnerability reports at your discretion.
> >=20
> > Cheers,
> > Sam
> >
