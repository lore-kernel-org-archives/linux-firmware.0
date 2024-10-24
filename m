Return-Path: <SRS0=RBjP=RU=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F23CE8E7C
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Oct 2024 14:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF868C4CECC; Thu, 24 Oct 2024 14:15:02 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75159C4CEC7
	for <linux-firmware@kernel.org>; Thu, 24 Oct 2024 14:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75159C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e3f35268so1187939e87.3
        for <linux-firmware@kernel.org>; Thu, 24 Oct 2024 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729779299; x=1730384099; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bAbwWCJIhjmDL10SOWhFgEPvuvKrrEovgnZDi+9VAfA=;
        b=iAJZnViwpR7LwknKrc8HczhRCspoqZXNgi7Phmks5aiSIlihsXA1WLD0yQzRdYxoX7
         anQ5yQNZb203Ii5fk4kKzi0klfMSFoYHG8uP5sBMb5poxddQHIMHpooLenmxGubXV65p
         TsXkAUlfnqWFk3bbwxuv4t7WZKJNedOqe+Q0yvdSI21RYudbTNa5piB5laYVZMdzWdwu
         obMv2cO/uU8o9+YOiUPHpoAqadNUEyUwhn03Dw5+GjJKTAjPKrGYPz08qtl7f6mxHzJ3
         qR1VsE6rkB2S8Io5YfukMQRiegv5amzMhF6BBLOftPBAdUICxWARups9Y1/p2WNFpSem
         NeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779299; x=1730384099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAbwWCJIhjmDL10SOWhFgEPvuvKrrEovgnZDi+9VAfA=;
        b=IH5iA6R754mBzpvZJAS4zoN85k7GT8YKgkBHE1Kw2CrY35IdADD2yFdaICjJrBw5fm
         H0H4Ipk1tR/v/9veW6R9M+RQFz7B8TdEHjDWpj5ivoCw9HqlrvpTbU3eoE3pVlqyvtJM
         1Q5D9Q5DCiPgJsBjhR6q8uHaXzAN5mnzZY1qs5Ya6g4kqRSNiT2oLMpNHxQIXoQh072r
         5h5J7O3kMIZTGTAmC7/FmhaSaL+7ALhVYuE2fwcHoi/iZDpIxHVImERtMf4XkmhAxBi4
         0e3bBah17FfNxUcuVB9eHxPsENbIYrTyaZw9KedqcrDA+B6LRsNUd37ubzXqBVqd8Zms
         FZsQ==
X-Gm-Message-State: AOJu0Yx1Cs4WMwKSSyabhOBIbGlYLgkccAYHtdbLcTAfaE9c887SfzhO
	nzPFEsDiEtGwNJIR+TYl8KUNWZI6ogmyag26YLN9q0NGVO4qSOqWVyVejpJdQpg=
X-Google-Smtp-Source: AGHT+IGDRne6FjUO8+JY3OAL+VZkSOAWuwWaVVfwT9eHEotWjUKxfy136t7bAVw+D1VRNrMm0Hvi2w==
X-Received: by 2002:a05:6512:3d0c:b0:537:a824:7e5 with SMTP id 2adb3069b0e04-53b1a30203amr3254616e87.18.1729779299297;
        Thu, 24 Oct 2024 07:14:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224312fesm1367096e87.187.2024.10.24.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 07:14:58 -0700 (PDT)
Date: Thu, 24 Oct 2024 17:14:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: 20220315151852 created <yr.yang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	shawnku@google.com
Subject: Re: [PATCH] mediatek: Add sof-tolg for mt8195
Message-ID: <qrrvxy6r2k6v36hmxbjsteiivqfjkjie3mfatakyp6mxoextnr@ubzg5osgkupa>
References: <20241024034558.667-1-yr.yang@mediatek.com>
 <20241024034558.667-2-yr.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024034558.667-2-yr.yang@mediatek.com>

On Thu, Oct 24, 2024 at 11:44:07AM +0800, 20220315151852 created wrote:
> Add sof-mt8195-mt6359-max98390-rt5682.tplg
> 
> Signed-off-by: 20220315151852 created <yr.yang@mediatek.com>

This doesn't look like a name or identity of any kind. Could you please
fix your Git setup?

> ---
>  .../sof-mt8195-mt6359-max98390-rt5682.tplg      | Bin 0 -> 16191 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
> 
> diff --git a/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg b/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
> new file mode 100644
> index 0000000000000000000000000000000000000000..427d6c62387b53f8ac898a86b506e8c0cb4362a7
> GIT binary patch
> literal 16191
> zcmeHO&1(}u6pz+w(N^lmNqX2rz=IIFNk73u)1-xBYy&knp+qefth6*Oq_-X_2p+7W
> zAby-g@aSC+A_#udqem}7|BL$jxwCPS?(WQ{N!qRR;O(32zS(*6oB8Esb~BlU>2!O{
> zkq(%+D3^pi1iL88-LUjIB2=7isA<F9+InIcDJ+KPhV=y384^QShn|4uGnegwJPI0;
> zFP2Knb4v>=H|MPUd~x+!@%k;x9`LNW4e`7nPG(^(QD#h!ap>%Raj$&)etP5OudVjY
> zI~N!?V`aBCaQ!gs13E(<3Cn&E+R?(eo#^G2#)_&RJ!p=~I2qp!=o(_1g)KrEUl%kz
> zKGvI<DqKNPDe#?{o*JLY=8{TZReV2j2TR<AkP+weU2i_T+s>z7or_;x{rLNm9RD-n
> z`&`&KEc@n;0Z(%b*jIN9E~3nPQ=dW+KaP4L*L{c^l<a|dVy7d-_7pTfksr%VOpYb&
> zgc4?@gVeAJThfN{6Q85dPtYv@^%<7()iJSe!hVM(MnA;ov#_kob6=o$&%^?`OU&ud
> ze!JWq+!c2Rai^W4>US1ZEK!ZIH-Njzea>AwJa<z9A%CO7xgPFvJR-^6B)J<5v(iC=
> zT7_+^xy$cQm%E)PGw%*%q<{m8a^B4p7nfI-W-WWjyMn6U^>CLh)qdymJE$9qyqnrD
> z++~uI^X^H+hdGl>OiZGr7Wn?nyM<hz(piObJ>2E@JGn~^$Dy1roHu^IedOG^r+GI;
> z?gqoGbU;5{QDN)F-OXdo%ex#0>N?cr?(lB7JM8wf+N%1Ug}WuH=;mFz2XMD<pK~`A
> zp1b`5A%CO7xgPG4r;+4tAGsS0v(iC=T7_-1xr?uX%6fN%2>?RwZeW0P*Ho+{eEpWU
> zbg2mQAeEdnVi0H)0&}>L{M%3U%!TvZm9@9A7?r;%T;&{nPlpj6I9vB_#{T1@dY!~*
> z9X_Tk+k44Mmx}P20Cn$rR|&-w4iEzVeDt1_QRJh}+J{3*KEl^`9V!p|X?&nk3@05N
> z%rQC$)bd{S45kshck^Q*r(VwxNr#X9mhH2)l+ngx<`|V?_~_tZj?qEDmybSkzY%<t
> z->Du4RB-{<T8~p;8)d!(f?&O@{r=9WVU7lY)*w)BO*5tygMdMx2?*5wUVDu;n1Yyp
> z_?%}1If&1F(y;t2zatvOxiJ5)kn4thza;;+!TnFk&ittN><8U2Vi0Hv0wzDU1ZLBS
> zL7*uJL^VG$?%MpQ`z*F8K$@Ex1UwKh`OyOubIKqP5d@-|AGwy@nIHAujYMQ<Oqd4%
> z0h1pOz#y6~{I>{1H9zwI$MQQ$J`Z-^QFfqH>=$!rv-U}b*++`^quP5R5wf;~>01z1
> z#7SV)lznN$N_XELunOK3rHxLtBe2r$TM$;9cf=~pex~Y3f<J}XUlhhSxYg>b7=z%=
> mEs}c>R_;3*Vx_x(M7p)Ii2iHu=LqAgY*=ytR>7MIB;P-JU)df2
> 
> literal 0
> HcmV?d00001
> 
> -- 
> 2.46.0
> 

-- 
With best wishes
Dmitry
