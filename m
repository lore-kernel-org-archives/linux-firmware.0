Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4966C7EE2E
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jun 2023 10:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F77DC433EF; Mon, 12 Jun 2023 10:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4E6C433D2
	for <linux-firmware@kernel.org>; Mon, 12 Jun 2023 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686567294;
	bh=Z6dJ2HD7EiEPchvSYlxjLe7FNtTTXNUYnQfYiQ6Aaqc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Racaj1wLbAGLu7XNAKmGK4Mdvw/e8C9kjBYbOjRID+sHNeTYCRt3pLemTZ0iQlxJ+
	 h9udiXRdCRdFPpDKwbrGw7w+FlHCaq4g6UD4bJsC9bLQslkHKs0TDNnyWYLzfUA4Mq
	 2geW2PXRU770Gsl5dsHs2wY3awnfKJbxP1hfKIxT03YvvkIoXUGbZFYFF/QhTst0ME
	 +bX8Ik5Joc4UCHRFUFARwNVA7MHhTvgjnybkbs1xcjMNOWD6iiBWpASqeajh0yXagu
	 7miRiCu8VKlLOJS75mjh/PHVHlwgpW3PwNrhUY1wNHQRr4NeHbTYbf6efVZs04S1c3
	 h3TKSz8dVLV4Q==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-bcad7f7dabcso543937276.0
        for <linux-firmware@kernel.org>; Mon, 12 Jun 2023 03:54:54 -0700 (PDT)
X-Gm-Message-State: AC+VfDxnXo0Ceqq+8qOBxpiRkE1wdM9fgfGM5MK8rO/LVY7h2cd3Q/k5
	A2tsm8xXNxQih7lNVdlKSXZ6wtmPO1xECjjFdvc=
X-Google-Smtp-Source: ACHHUZ6p9BozLVu2BS/z1gzcvaLnoYc7DIMSlP0O9SuVI4YlBJ1zUrO+UQ+kzwrw85JVT3tbVvjAbaSYrYVFRLgtQTw=
X-Received: by 2002:a25:268f:0:b0:bc3:cc17:6250 with SMTP id
 m137-20020a25268f000000b00bc3cc176250mr4265525ybm.1.1686567293396; Mon, 12
 Jun 2023 03:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <39201cca692b6fad77749bdc56d551c3aab9bc64.camel@mediatek.com> <eb84a05b47272bd97e08fbe9373c45a78b39e1bc.camel@mediatek.com>
In-Reply-To: <eb84a05b47272bd97e08fbe9373c45a78b39e1bc.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 12 Jun 2023 06:54:42 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6JoSBQ117sR_Ck9-pNwcy-uzGGdnA1OssWNsUVi1DRsA@mail.gmail.com>
Message-ID: <CA+5PVA6JoSBQ117sR_Ck9-pNwcy-uzGGdnA1OssWNsUVi1DRsA@mail.gmail.com>
Subject: Re: [PATCH v3] pull request: Update mt8195 SCP firmware to support hevc
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	=?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 5:46=E2=80=AFAM Yunfei Dong (=E8=91=A3=E4=BA=91=E9=
=A3=9E)
<Yunfei.Dong@mediatek.com> wrote:
>
> Hi,
>
> This is used to adjust hevc hardware decoder.
>
> Please let me know if there is any issue, thank you.
>
> ---
>
> The following changes since commit
> 1f9667ebd8e6aac23bab8e95b0d555181dd432ba:
>
>   Merge branch 'for-upstream' of
> http://git.chelsio.net/pub/git/linux-firmware (2023-05-30 07:46:20
> -0400)
>
> are available in the Git repository at:
>
>   https://github.com/yunfei-mtk/linux_fw_scp v2.0.21478

Pulled and pushed out.

josh

>
> for you to fetch changes up to
> 795aea911f227ecbf8481d223f39a5b2856d466f:
>
>   mediatek: Update mt8195 SCP firmware to support hevc (2023-06-01
> 17:40:42 +0800)
>
> ----------------------------------------------------------------
> Yunfei Dong (1):
>       mediatek: Update mt8195 SCP firmware to support hevc
>
>  WHENCE                  |   2 +-
>  mediatek/mt8195/scp.img | Bin 587828 -> 639700 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> ---
> Best Regards,
> Yunfei Dong
