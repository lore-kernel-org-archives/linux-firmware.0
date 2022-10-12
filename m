Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD15C4332F
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Oct 2022 17:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43A6FC433D7; Wed, 12 Oct 2022 17:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDC2C433D6
	for <linux-firmware@kernel.org>; Wed, 12 Oct 2022 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665594391;
	bh=B+S46y1hW0O9Zhjqx+GVuX72AMv9m1uQMX2+DHq/4+w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lnoS7Yl5T5R2lGXhj3KcLKqGBEvh+BQQZbBx79D3fqKJ4hdj9Fom3C+oN6JDoSjzi
	 NQ/bnmFOAGSMMusqmLALGc3R7Vpcvnnqg9l0b+RtkGKINKAovbVUazPOqgh7nqQbUt
	 F1vab6kznEVMwHM2guMLitIuvJr10xOOyWsVfu4HGZcGHUd6qoQneL8ki/bO2ASo8K
	 T5UCs3n1A2PQTkrS9uL/hFCbzxDNBj3kzdtTwuhhUcRDAjvSF8dAph4hbFsZoJ5/HF
	 GaC+hXlqmz2eHs3qVst3CfzjzUedgxkQ3FBEIcDeLXf511eKk+RWX2qhoLGXNpLLlL
	 bIElK1AA0lB5A==
Received: by mail-oo1-f54.google.com with SMTP id j6-20020a4ab1c6000000b004809a59818cso46540ooo.0
        for <linux-firmware@kernel.org>; Wed, 12 Oct 2022 10:06:31 -0700 (PDT)
X-Gm-Message-State: ACrzQf2/OFKajQNQuQJ3pdfch1IRdkUgNsAno68jRQ6qNsyLB1MxgjCw
	GRZZGZtoEfM9GG2gWhran3w3bJsuUmCZbSJItuk=
X-Google-Smtp-Source: AMsMyM6HBaz7V3Nekh4R4ISqCy/u2+AmcL5d+4SdUXmjjSiFvf/t/e5JOMdACso+vrgy7xZvO26lGSMfrP5ca+uKaRE=
X-Received: by 2002:a05:6820:1890:b0:480:623d:61f9 with SMTP id
 bm16-20020a056820189000b00480623d61f9mr8280661oob.45.1665594390302; Wed, 12
 Oct 2022 10:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <676d04caef93b8608ef14aebfbeb06a7b4af9cd3.camel@mediatek.com>
In-Reply-To: <676d04caef93b8608ef14aebfbeb06a7b4af9cd3.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 12 Oct 2022 13:06:19 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5743hCTekT974gOB8qk5mm_7kO+nadg=mUQyyUWnyEMA@mail.gmail.com>
Message-ID: <CA+5PVA5743hCTekT974gOB8qk5mm_7kO+nadg=mUQyyUWnyEMA@mail.gmail.com>
Subject: Re: [PULL] mediatek: Update mt8195 SOF firmware to v0.4.1
To: =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 7:32 AM TingHan Shen (=E6=B2=88=E5=BB=B7=E7=BF=B0)
<TingHan.Shen@mediatek.com> wrote:
>
> Hi maintainers,
>
> This pull request updates MT8195 SOF firmware.
>
> If there is any problem, please let me know.
> Thank you.
>
> Best regards,
> TingHan
>
> --
>
> The following changes since commit fdf1a65258522edf18a0a1768fbafa61ed07e5=
98:
>
>   linux-firmware: Update AMD cpu microcode (2022-09-30 17:33:35 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-20221011
>
> for you to fetch changes up to 675bd6a24ba15d0d9a0550158a1b2c5102aa0337:
>
>   mediatek: Update mt8195 SOF firmware to v0.4.1 (2022-10-11 19:07:12 +08=
00)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8195 SOF firmware to v0.4.1

Pulled and pushed out.  Thank you.

josh

>
>  WHENCE                                                     |   2 +-
>  mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg | Bin 20895 -=
> 20895 bytes
>  mediatek/sof/sof-mt8195.ldc                                | Bin 40568 -=
> 51168 bytes
>  mediatek/sof/sof-mt8195.ri                                 | Bin 100740 =
-> 173832 bytes
>  4 files changed, 1 insertion(+), 1 deletion(-)
