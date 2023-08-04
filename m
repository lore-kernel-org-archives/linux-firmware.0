Return-Path: <SRS0=8JhL=DV=gmail.com=jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2544EC00528
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Aug 2023 10:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8FFFC433C7; Fri,  4 Aug 2023 10:33:51 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07F3EC433C8
	for <linux-firmware@kernel.org>; Fri,  4 Aug 2023 10:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07F3EC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-583b3939521so22620497b3.0
        for <linux-firmware@kernel.org>; Fri, 04 Aug 2023 03:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691145230; x=1691750030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNrJ1HOAbiZBfVR0yPv5HkzEwWdU1S+Y3YLuwqkaxX4=;
        b=gl4Nse/NngXGPKBpTA52zVvyYeENNIR/0/eer0RW2AcBiRcTWQZCpq/emo+ql/IVrP
         oSlzrobH3xHdOUudmOCu3s2lHxsAQWUVLjAmPxFCx2FlrTgRnNEwb3/0kKo23CW1d14B
         WoSxdXrX/qolXgaxetPTXgq/Kfzja9NwlCc8QPVmQFI5Nc1nr8txsYakORX3ub3Vtptq
         Z/dmOWim6NhIefFKmSRmlgOqTez16xfAo+HsjuTKH3s+dQ7n9XAAOhd98ijShDZufcko
         2d/h872fKz6KiyyEGorfkoNvDyeU4PfyHNqsxaB0hUccVJhsk2GUXgYCMNvT8lUW/gaK
         LziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691145230; x=1691750030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNrJ1HOAbiZBfVR0yPv5HkzEwWdU1S+Y3YLuwqkaxX4=;
        b=F7eqYHeTAdv/xotdZr4zDHKc9EFUHLej/EboODyEl0vhwCbREp4EQ4k+H6uhr6S7Db
         bwnwpETwmkQ0v7UwnpKSRyz2xm2YQjJayA/mem6+SnFici0c1QDJCFOiEikkSpRNltTI
         MSW+5FoRr3pOXCbV2A/HjPVsDzs5UEFj9y38jLk6LQcZis3XMzrrk+vwYkZ30sxFxcw2
         allYbM5MAqpWQzgbDweGlQ0iqytk+Vz9STbLZNc8DlQVBpXQ/6CDcb9UCVypBX75Koba
         EIt35YXXA2JZz/L8hV53nKzQGy+TYYFV6bdyWY1i1lXLv4nVQ150uhmo34GJwHeayW2g
         NZ8A==
X-Gm-Message-State: AOJu0Yz/2D24NPbfqk2dnLtM4+lyyZuNDHkG8qWpiL9WlgMOfGt3SXmU
	020M9YiqCqRXp8+NYmDV0lHeLptTG0KUeyWNojQ=
X-Google-Smtp-Source: AGHT+IHGZi+tAsUsFcGRJ8AJMJr4ApwVYBL46H7w4p4cG/StaRGDULPOegoYrSePo+qTikAycyYJg1L/yJ5vrRxh01o=
X-Received: by 2002:a0d:ca89:0:b0:583:9018:6fbb with SMTP id
 m131-20020a0dca89000000b0058390186fbbmr1264511ywd.37.1691145229780; Fri, 04
 Aug 2023 03:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <d42463c65334bc1799648b116b9e0daecf57c844.camel@realtek.com>
In-Reply-To: <d42463c65334bc1799648b116b9e0daecf57c844.camel@realtek.com>
From: Josh Boyer <jwboyer@gmail.com>
Date: Fri, 4 Aug 2023 06:33:39 -0400
Message-ID: <CA+5PVA6LkCGWCRS71d6GoZQ-LaZpGTs6ukzwiW4HJrCb2FsJ2A@mail.gmail.com>
Subject: Re: pull request: rtw89: 8851b: update firmware to v0.29.41.1
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 10:46=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> Update 8851b firmware of rtw89 driver to v0.29.41.1
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 253cc179d849fc82489773b2b553a49858d872=
5f:
>
>   amdgpu: Update DMCUB for DCN314 & Yellow Carp (2023-07-31 11:22:02 -040=
0)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.

josh

>
> for you to fetch changes up to 29f185d75c45ab96473b4ee06bc82c0b3ff966b5:
>
>   rtw89: 8851b: update firmware to v0.29.41.1 (2023-08-02 10:41:59 +0800)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (1):
>       rtw89: 8851b: update firmware to v0.29.41.1
>
>  rtw89/rtw8851b_fw.bin | Bin 1090544 -> 1161008 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
