Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0ACC3DA49
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Jul 2024 15:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEFD5C4AF09; Tue, 16 Jul 2024 15:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4604C116B1
	for <linux-firmware@kernel.org>; Tue, 16 Jul 2024 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721142589;
	bh=P5JEQAwH9uwONnESxdjci7phpAvVS090cUpXyIRoX8A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BRTRwzoohpRSdyrZBPETm0jnd++qWpTIPiCEIS4lj3zQ39bbri2ZPIavy6bqiZR2I
	 AQpUcY2Q+0UqzBxgME8EdMsJBZikxJf44rRivAJRb8/bOiAAV1DUpl336mBghv7ZTc
	 tbqa5zYUSppwXxPqjHRh5pqhWKAor2NyG43vFxoUYb/0KWBJl4RY52Uayuk0tsx6Ve
	 koZyIaYYw3bzxA/Q3GWicK5jSk6N9sTPs5YLw3Aql9hQC0HZWJf7xCRTjkY9G5vYdO
	 G5qR+MgEtR2afukkNWj8NHCpYsz6zqaMZdGko4pP6vdCwGK1uGzG8s10U8WZonZLl8
	 0N9VuvYnOT9Ww==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-65f8626780aso33313757b3.3
        for <linux-firmware@kernel.org>; Tue, 16 Jul 2024 08:09:49 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz+nt3800UD1Zp5WRdcxNwJN40r8Bc0WcrtrY5GbBPyLh9885rB
	MSy3b284XF9Ue/LzZwACUDt1Lkqsk3TsYj2GgemcUFUt9P2syviUuQeAjtbGNj4dnvhaoXYf6xo
	YGd4ep2QunOyiAs9q6XHOU/oTwFg=
X-Google-Smtp-Source: AGHT+IEGL0lCTEH3+ZOAvwhTSWhATr3pk5dCDPWai+5LJO3I9vYyo3VMO16Vo5WvTJP86jy/es27Odx4BJxNhMkN68Q=
X-Received: by 2002:a05:690c:4:b0:664:6532:bd40 with SMTP id
 00721157ae682-6646532c64amr9311627b3.14.1721142588912; Tue, 16 Jul 2024
 08:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <09899e7a-6a34-4c21-bf18-6533e22b2d22@gmail.com>
In-Reply-To: <09899e7a-6a34-4c21-bf18-6533e22b2d22@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 16 Jul 2024 11:09:37 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7oS2hBGTudjCzbwrpXfbdYpL7_UbqL-inhm4tKaSRGCQ@mail.gmail.com>
Message-ID: <CA+5PVA7oS2hBGTudjCzbwrpXfbdYpL7_UbqL-inhm4tKaSRGCQ@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: Add firmware for RTL8812AU device
To: Nick Morrow <usbwifi2024@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 10:50=E2=80=AFAM Nick Morrow <usbwifi2024@gmail.com=
> wrote:
>
>
> This firmware was extracted from the  20210708 - v5.13.6-23 release of
> the vendor driver for this device and is believed to be the latest
> release by Realtek.

We'd need someone from Realtek to submit this, or include their Signed-off-=
by.

josh

>
> Signed-off-by: Nick Morrow <USBWiFi2024@gmail.com>
> ---
>   WHENCE                |   1 +
>   rtw88/README          |   3 +++
>   rtw88/rtw8812a_fw.bin | Bin 0 -> 27030 bytes
>   3 files changed, 4 insertions(+)
>   create mode 100644 rtw88/rtw8812a_fw.bin
>
> diff --git a/WHENCE b/WHENCE
> index 368a8e90..befd2814 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3267,6 +3267,7 @@ Licence: Redistributable. See LICENCE.rtlwifi_firmw=
are.txt for details.
>   Driver: rtw88 - Realtek 802.11ac WLAN driver for RTL8822BE and RTL8822C=
E
>
>   Info: Sent to Larry Finger by Realtek engineer Yan-Hsuan Chuang <yhchua=
ng@realtek.com>
> +File: rtw88/rtw8812a_fw.bin
>   File: rtw88/rtw8821a_fw.bin
>   File: rtw88/rtw8822b_fw.bin
>   File: rtw88/rtw8822c_fw.bin
> diff --git a/rtw88/README b/rtw88/README
> index 469db2f7..ef3a7505 100644
> --- a/rtw88/README
> +++ b/rtw88/README
> @@ -19,6 +19,9 @@ except that the device cannot be waken from the wireles=
s NICs.
>
>   Currently supported devices with corresponding firmwares:
>
> +RTL8812AU
> +    rtw8812a_fw.bin
> +
>   RTL8821AU
>       rtw8821a_fw.bin
>
> diff --git a/rtw88/rtw8812a_fw.bin b/rtw88/rtw8812a_fw.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..eabb779a944e7120e1de4025e=
05d89a74379b066
> GIT binary patch
> literal 27030
> zcmc(|d3;k<`ahm~votMT($iAPCM6VbVQB$3MkNReqX?}HqNotGiVI3Aw}{q~3yi3U
> za%<}{jx=3D$qEV6X!RL5<kSl3aY1!r7GE|3%j(%dLPuubxPKj$U|#F@|M^ZNbqlWESm
> zXMN5&&w0+XoioDIHp4hWrolEe`=3DZ5n8VncRXE^OYaq0!)lJwJ)9>_oa`;o6t`~LNZ
> zxMU4a5<Lfbn37_(rXprZv8JZ|MkrWPc)B2>0P+RVm<&ycZ&M1d+$%jJGs~9Ea&pIv
> zDI7Cq($)0u20e1a>|cjvJt<|guPt-V#Q(0Fb^Q&q`Ol3v-TdqD=3DAM+BZx#eW1RO?_
> z$!s=3DTEEqy++ONa3UNo>Y{MV}&%A<zSWConckjh)rdZh~@ZwM`&jEN?z&6b-#U_e1Z
> z!G8)1&raqPo-LR}lgXHFN;lH{@UAS@RO$&qnuy<Y8_P|8r)MTp^85d{^1qdLYTew7
> z-kH6#@@##w^I3jQe!O?49`76P7w;eEi;JJ!^xTZhT)iCYlOEUOIeqeT`sVlRn=3DEy~
> z$O}hZIQpWZi;KsP89#RXxbf%zE`H%C{rh+4UlPAGep!4%JRUchMvNFaV${gd7g8Sn
> zjTt{~#0b>Z>t6i3@t6GW(n~J8G}-R|&*6KGa%>EnH16THUX^XuSJd}b2UZo%kE{x;
> z9``_G_3qV23LiP%@s21;@z$r8H9HKBoevn7$ax)Bcdz#vJBs!hC+8pA-Dv$Pc<Avq
> zdmueNq;T2sEUR^!(d02KS=3DLeH|IrXgZ}pZGnA4?|L(`9UMAt2|c5F?5mzvyh{QG-c
> zs<op<m5&9|_jnz{1L@RXB0HMjvEz7P**z{xn|dr?jv#a8$H#i7%X<Rp)Q`tRAgD&$
> z{&bI_XkSXv0h7n-JnDSt!`+Qe`SKL|l9lV0NutXVw=3DRzF?eZA?OXOqLW7fUDELpa=3D
> zNSXSfB-FO3e*8^(OsHJts$BiR?$x^+?P6$8o#-%n;&y4-=3D+VbJ3Ia#b(c~fwbZdGi
> z1~WKQS~=3D=3D?#|djkJ|9Okc&95h^<dw=3DKc}Y3Kjr1gUw2|KCi61$GK$!#w6)_z=3DWFT=
W
> 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
p
> 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
R
> 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
=3D
> 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
AL5
> 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
> J=3Dh$Cs{(mF+Uzh*@
>
> literal 0
> HcmV?d00001
>
> --
> 2.39.2
>
