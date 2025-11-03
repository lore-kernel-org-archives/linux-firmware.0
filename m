Return-Path: <SRS0=84sB=5L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96547CCFA00
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Nov 2025 02:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 621B0C4CEFB; Mon,  3 Nov 2025 02:54:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9B95C4CEF7
	for <linux-firmware@kernel.org>; Mon,  3 Nov 2025 02:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9B95C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2MtY6c1420878
	for <linux-firmware@kernel.org>; Mon, 3 Nov 2025 02:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MlPBJagR2NsdDPJdHZthduKK
	sDD5i/vpebzdYn7l2To=; b=dQHK1B+yWZEzW3+iGKD7KzEWsXSlAoy11tQVRQl1
	2ldx4ZQb6Rl8/wPTrk1kSj5LMdp1nUQ6VlH3dLbYNvbMDHzTSyNbM9zVLYKuxRs7
	pAQskYjzCzjLHGTKoMjB+iDGnVyKwhT0G6IGs7J0PylbqzqcYpW5XhCaqhMcB1pU
	if//DzbCZWx9dWpm4VAK1tNrq7xKB7a6hlhKUYG9NzTp0LDVzyTk6Xm+HJEtZZ4f
	x/GEUFW8Ox9XmM3RS6vm8d1C6a/InzBg4ZyruGQuE3OzmZG9plJiAms+n+6ij9i1
	W57QAXrkryk+Zf9trNg++TVw4KSptoTELCJRJktm43c2wQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a59hhk4bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 03 Nov 2025 02:54:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8908a248048so969477885a.0
        for <linux-firmware@kernel.org>; Sun, 02 Nov 2025 18:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762138445; x=1762743245; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MlPBJagR2NsdDPJdHZthduKKsDD5i/vpebzdYn7l2To=;
        b=X5209oApq4p4nmHcgk5bqadZh4PWECX5h47VJ73YOhIY9zTiWnKmF5h/bQJZU2s6yT
         O4snwrLTAP3qMwc+MWvQwYIX73xaIIeA7UNAGiyywC1AgPpdKKEf3ewziucvjUdEpng1
         y/P4GR1XLRtV200+SvPh37tWL46CERBI8UP3mWaLsfjLQ5Tg8OxEMHl+Wt2LZhyx8rTG
         fNK5nMfAiV5AvA8cZFpL13KMsGH8supA9R5ZpyyhQiVNOfkkbKCAjMYKRg3NjRrbNiNz
         2EbI6GN3RrY2Fkm7fmt1D/acJa1yESSFgU9sWYHJ73W/HbdncQtMnepCFuR0hRipCX7R
         R39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762138445; x=1762743245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlPBJagR2NsdDPJdHZthduKKsDD5i/vpebzdYn7l2To=;
        b=FmOfS3mpulCPZriVEBq0XAjFDN8447gn+sohWG+xJjh4iLaLE252ST8bVddFPOG2jf
         sYYTw8ZmIUzZWb5ipgUjyaDR707c86eJhOZTJKMGpKnO5wf4jqgUqUo24ViabBbLc1ya
         auDNtSk7stl7z2sAdFs0NkdWK3BUFHvJ/9vvqouIvwS3Oe4yR5Txil1GGYS09iBvNWT/
         qfiNMlTU4mDkzdE85v0GAn/aatYRTacPDcE9wTDytSCbtkWuCaeDhJpJLYy7OCg3cDaW
         R1tWCetnIVSPjaPlaI72Tt/mwRBdWrR/vxnTJn61MInmNl7AgXjsTlKG+me/XzVMuPSK
         pnRw==
X-Gm-Message-State: AOJu0Yz9m4j3+zDy8ymDlvXKZ/dFrntfoHMLocvvd2EftPh5/Jj1xhvS
	gSvQ3K9MB6crjJPyLlapwc8LoNlVjmvpuPgtjHujnyA7ep3wI51iWUmve2p3O/4RMrlHbYwFXWZ
	RllaJ/3SUPK42894476clIzttr6a8MXuyrUAqBN8MGoPynaGEdkP+UPZSQBdL1LjOOC1C1ok=
X-Gm-Gg: ASbGnct3SRDpl5Z2PWhbXUMrMqNHIezFfzLcM5BcMd8/IEjpsziCoRl86zBqIbSE0bR
	+r0chwgVdPV25xn++yEYILqux3VcxT5ksthmZZqBuHLwNwJlc/Yx0N3Rh5cjrdEZJRGpUWxiKDQ
	3b5TMmxEwPVLfAL2xHtHKGzljsYsur5a1lsmm7HUdQiKYXC542k/xp87XOAqXGa2zKPtSdyhBMw
	TPN/6KIAgtbP5ybqcQ95BeBkhcFoy9vyAFGzRGIQ0rVt6gTFtshPgrzUdjI7uC1MJirqx3PoH1b
	HpcL4VEVKp2U8bButGAiG9iRtOXuBYdBIk500pFBd/gkDLSvPt9eUndIGOV0qd3dll0JPxjCgNR
	7kEH7FTYdx01Zx8RZz3DlJOMvuqj8Awb0TU7mGxDNUVyLHK2EE71jHTCDUePay4GUFRpCo1H5+b
	cKBugH3SRSV53r
X-Received: by 2002:a05:622a:5817:b0:4ed:1ae1:5392 with SMTP id d75a77b69052e-4ed30ddde63mr141879441cf.19.1762138444658;
        Sun, 02 Nov 2025 18:54:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPZJy+7H9T+Ml6twnzA4rgsJ6xBm8k6E6PHNCa0wh/vqJjCfluep3+iHb6X0Y9dgHDP051Tg==
X-Received: by 2002:a05:622a:5817:b0:4ed:1ae1:5392 with SMTP id d75a77b69052e-4ed30ddde63mr141879151cf.19.1762138444047;
        Sun, 02 Nov 2025 18:54:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1c0e6446sm20532111fa.50.2025.11.02.18.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 18:54:01 -0800 (PST)
Date: Mon, 3 Nov 2025 04:54:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, baojun.xu@ti.com, 13564923607@139.com,
        13916275206@139.com
Subject: Re: [PATCH v2 1/1] linux-firmware: Create audio folder in ti folder,
 and move all the audio firmwares into it
Message-ID: <xnssowk57abxjy66xzbizycgutcjey2ypqncxxx55653liqh4y@vhz4g3atdiit>
References: <20251103005833.1945-1-shenghao-ding@ti.com>
 <20251103005833.1945-2-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103005833.1945-2-shenghao-ding@ti.com>
X-Authority-Analysis: v=2.4 cv=V6lwEOni c=1 sm=1 tr=0 ts=6908194d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sozttTNsAAAA:8 a=OOEuak7KQfGQPx7dsLAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7xY-GlXrmP1KmSx-Dr_1n6AkZzVUL6Yy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDAyMyBTYWx0ZWRfX54Vs7uyDcDln
 z8siaUdbMKTMPpIqXNk9D/ShuAmajwsVbL0r2mHqtmVzZnSEE/r2ch+Km844dsPg2mFH2bq3TP/
 vwSsmMktjZBQgilki+qjrZ7ziwCEwXA7/9zj3021oxDGmnPj6er1R3pjIQVbkmPxjv6Srw7T1GC
 XJOJaAsyMdc/3j8n3SK/CithLlbfGHGjBKOLPVCYuDRGA0vv/ufyRjgIuaEPqhwwKX2hYghwT36
 3IHMX0tAZqBbuEeld4Bry7JcWq0nkhBW4RGunUCV/WemiUIIIIgZfXZf6u6hWmQ4stzyMv9jomv
 4shUq9xPspFYTs0ey/5ISGRGmo5rDXcnFIkyibjrahYDeN+1STrA9wgyS5fElGEVSNzk0+1jf+9
 8JTUo8dKK0HPTj0PTVFRlOHW9Aheew==
X-Proofpoint-ORIG-GUID: 7xY-GlXrmP1KmSx-Dr_1n6AkZzVUL6Yy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030023

On Mon, Nov 03, 2025 at 08:58:33AM +0800, Shenghao Ding wrote:
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Missing commit message

> 
> ---
> v2:
>  - Rewrite the comments.

Which comments?

> v1:
>  - Create the audio folder in ti in order to only store auido firmware.
>  - Move all the audio firmware into the newly-created audio folder.
>  - Update the year to 2025.
> ---
>  WHENCE                                  | 302 ++++++++++++------------
>  ti/{ => audio}/tas2563/INT8866RCA2.bin  | Bin
>  ti/{ => audio}/tas2563/TAS2XXX3870.bin  | Bin
>  ti/{ => audio}/tas2781/TAS2XXX0C94.bin  | Bin
>  ti/{ => audio}/tas2781/TAS2XXX0C95.bin  | Bin
>  ti/{ => audio}/tas2781/TAS2XXX0C96.bin  | Bin
>  ti/{ => audio}/tas2781/TAS2XXX0C97.bin  | Bin
>  ti/{ => audio}/tas2781/TAS2XXX10A40.bin | Bin
>  ti/{ => audio}/tas2781/TAS2XXX10A41.bin | Bin
>  ti/{ => audio}/tas2781/TAS2XXX11540.bin | Bin
>  
>  Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
> -	 Copyright (C) 2023 - 2024 Texas Instruments
> +	 Copyright (C) 2023 - 2025 Texas Instruments

Just renaming the file doesn't bump the copyright year.

>  
>  --------------------------------------------------------------------------
>  
>  Driver: ti-tas2563 - tas2563 firmware
> -File: ti/tas2563/TAS2XXX3870.bin
> -File: ti/tas2563/INT8866RCA2.bin
> -Link: TAS2XXX3870.bin -> ti/tas2563/TAS2XXX3870.bin
> -Link: INT8866RCA2.bin -> ti/tas2563/INT8866RCA2.bin
> +File: ti/audio/tas2563/TAS2XXX3870.bin
> +File: ti/audio/tas2563/INT8866RCA2.bin
> +Link: TAS2XXX3870.bin -> ti/audio/tas2563/TAS2XXX3870.bin
> +Link: INT8866RCA2.bin -> ti/audio/tas2563/INT8866RCA2.bin
>  
>  Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
> -	 Copyright (C) 2023 - 2024 Texas Instruments
> +	 Copyright (C) 2023 - 2025 Texas Instruments
>  
>  --------------------------------------------------------------------------
>  
> diff --git a/ti/tas2563/INT8866RCA2.bin b/ti/audio/tas2563/INT8866RCA2.bin
> similarity index 100%
> rename from ti/tas2563/INT8866RCA2.bin
> rename to ti/audio/tas2563/INT8866RCA2.bin
> diff --git a/ti/tas2563/TAS2XXX3870.bin b/ti/audio/tas2563/TAS2XXX3870.bin
> similarity index 100%
> rename from ti/tas2563/TAS2XXX3870.bin
> rename to ti/audio/tas2563/TAS2XXX3870.bin
> diff --git a/ti/tas2781/TAS2XXX0C94.bin b/ti/audio/tas2781/TAS2XXX0C94.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX0C94.bin
> rename to ti/audio/tas2781/TAS2XXX0C94.bin
> diff --git a/ti/tas2781/TAS2XXX0C95.bin b/ti/audio/tas2781/TAS2XXX0C95.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX0C95.bin
> rename to ti/audio/tas2781/TAS2XXX0C95.bin
> diff --git a/ti/tas2781/TAS2XXX0C96.bin b/ti/audio/tas2781/TAS2XXX0C96.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX0C96.bin
> rename to ti/audio/tas2781/TAS2XXX0C96.bin
> diff --git a/ti/tas2781/TAS2XXX0C97.bin b/ti/audio/tas2781/TAS2XXX0C97.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX0C97.bin
> rename to ti/audio/tas2781/TAS2XXX0C97.bin
> diff --git a/ti/tas2781/TAS2XXX10A40.bin b/ti/audio/tas2781/TAS2XXX10A40.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX10A40.bin
> rename to ti/audio/tas2781/TAS2XXX10A40.bin
> diff --git a/ti/tas2781/TAS2XXX10A41.bin b/ti/audio/tas2781/TAS2XXX10A41.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX10A41.bin
> rename to ti/audio/tas2781/TAS2XXX10A41.bin
> diff --git a/ti/tas2781/TAS2XXX11540.bin b/ti/audio/tas2781/TAS2XXX11540.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX11540.bin
> rename to ti/audio/tas2781/TAS2XXX11540.bin
> diff --git a/ti/tas2781/TAS2XXX11541.bin b/ti/audio/tas2781/TAS2XXX11541.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX11541.bin
> rename to ti/audio/tas2781/TAS2XXX11541.bin
> diff --git a/ti/tas2781/TAS2XXX12040.bin b/ti/audio/tas2781/TAS2XXX12040.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX12040.bin
> rename to ti/audio/tas2781/TAS2XXX12040.bin
> diff --git a/ti/tas2781/TAS2XXX12041.bin b/ti/audio/tas2781/TAS2XXX12041.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX12041.bin
> rename to ti/audio/tas2781/TAS2XXX12041.bin
> diff --git a/ti/tas2781/TAS2XXX12140.bin b/ti/audio/tas2781/TAS2XXX12140.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX12140.bin
> rename to ti/audio/tas2781/TAS2XXX12140.bin
> diff --git a/ti/tas2781/TAS2XXX12141.bin b/ti/audio/tas2781/TAS2XXX12141.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX12141.bin
> rename to ti/audio/tas2781/TAS2XXX12141.bin
> diff --git a/ti/tas2781/TAS2XXX1EB30.bin b/ti/audio/tas2781/TAS2XXX1EB30.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX1EB30.bin
> rename to ti/audio/tas2781/TAS2XXX1EB30.bin
> diff --git a/ti/tas2781/TAS2XXX1EB31.bin b/ti/audio/tas2781/TAS2XXX1EB31.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX1EB31.bin
> rename to ti/audio/tas2781/TAS2XXX1EB31.bin
> diff --git a/ti/tas2781/TAS2XXX2234.bin b/ti/audio/tas2781/TAS2XXX2234.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX2234.bin
> rename to ti/audio/tas2781/TAS2XXX2234.bin
> diff --git a/ti/tas2781/TAS2XXX2326.bin b/ti/audio/tas2781/TAS2XXX2326.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX2326.bin
> rename to ti/audio/tas2781/TAS2XXX2326.bin
> diff --git a/ti/tas2781/TAS2XXX387D.bin b/ti/audio/tas2781/TAS2XXX387D.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX387D.bin
> rename to ti/audio/tas2781/TAS2XXX387D.bin
> diff --git a/ti/tas2781/TAS2XXX387E.bin b/ti/audio/tas2781/TAS2XXX387E.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX387E.bin
> rename to ti/audio/tas2781/TAS2XXX387E.bin
> diff --git a/ti/tas2781/TAS2XXX387F.bin b/ti/audio/tas2781/TAS2XXX387F.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX387F.bin
> rename to ti/audio/tas2781/TAS2XXX387F.bin
> diff --git a/ti/tas2781/TAS2XXX3880.bin b/ti/audio/tas2781/TAS2XXX3880.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3880.bin
> rename to ti/audio/tas2781/TAS2XXX3880.bin
> diff --git a/ti/tas2781/TAS2XXX3881.bin b/ti/audio/tas2781/TAS2XXX3881.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3881.bin
> rename to ti/audio/tas2781/TAS2XXX3881.bin
> diff --git a/ti/tas2781/TAS2XXX3882.bin b/ti/audio/tas2781/TAS2XXX3882.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3882.bin
> rename to ti/audio/tas2781/TAS2XXX3882.bin
> diff --git a/ti/tas2781/TAS2XXX3884.bin b/ti/audio/tas2781/TAS2XXX3884.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3884.bin
> rename to ti/audio/tas2781/TAS2XXX3884.bin
> diff --git a/ti/tas2781/TAS2XXX3886.bin b/ti/audio/tas2781/TAS2XXX3886.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3886.bin
> rename to ti/audio/tas2781/TAS2XXX3886.bin
> diff --git a/ti/tas2781/TAS2XXX38A5.bin b/ti/audio/tas2781/TAS2XXX38A5.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38A5.bin
> rename to ti/audio/tas2781/TAS2XXX38A5.bin
> diff --git a/ti/tas2781/TAS2XXX38A7.bin b/ti/audio/tas2781/TAS2XXX38A7.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38A7.bin
> rename to ti/audio/tas2781/TAS2XXX38A7.bin
> diff --git a/ti/tas2781/TAS2XXX38A8.bin b/ti/audio/tas2781/TAS2XXX38A8.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38A8.bin
> rename to ti/audio/tas2781/TAS2XXX38A8.bin
> diff --git a/ti/tas2781/TAS2XXX38B8.bin b/ti/audio/tas2781/TAS2XXX38B8.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38B8.bin
> rename to ti/audio/tas2781/TAS2XXX38B8.bin
> diff --git a/ti/tas2781/TAS2XXX38B9.bin b/ti/audio/tas2781/TAS2XXX38B9.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38B9.bin
> rename to ti/audio/tas2781/TAS2XXX38B9.bin
> diff --git a/ti/tas2781/TAS2XXX38BA.bin b/ti/audio/tas2781/TAS2XXX38BA.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38BA.bin
> rename to ti/audio/tas2781/TAS2XXX38BA.bin
> diff --git a/ti/tas2781/TAS2XXX38BB.bin b/ti/audio/tas2781/TAS2XXX38BB.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38BB.bin
> rename to ti/audio/tas2781/TAS2XXX38BB.bin
> diff --git a/ti/tas2781/TAS2XXX38BE.bin b/ti/audio/tas2781/TAS2XXX38BE.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38BE.bin
> rename to ti/audio/tas2781/TAS2XXX38BE.bin
> diff --git a/ti/tas2781/TAS2XXX38BF.bin b/ti/audio/tas2781/TAS2XXX38BF.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38BF.bin
> rename to ti/audio/tas2781/TAS2XXX38BF.bin
> diff --git a/ti/tas2781/TAS2XXX38C3.bin b/ti/audio/tas2781/TAS2XXX38C3.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38C3.bin
> rename to ti/audio/tas2781/TAS2XXX38C3.bin
> diff --git a/ti/tas2781/TAS2XXX38CB.bin b/ti/audio/tas2781/TAS2XXX38CB.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38CB.bin
> rename to ti/audio/tas2781/TAS2XXX38CB.bin
> diff --git a/ti/tas2781/TAS2XXX38CD.bin b/ti/audio/tas2781/TAS2XXX38CD.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38CD.bin
> rename to ti/audio/tas2781/TAS2XXX38CD.bin
> diff --git a/ti/tas2781/TAS2XXX38D3.bin b/ti/audio/tas2781/TAS2XXX38D3.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38D3.bin
> rename to ti/audio/tas2781/TAS2XXX38D3.bin
> diff --git a/ti/tas2781/TAS2XXX38D4.bin b/ti/audio/tas2781/TAS2XXX38D4.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38D4.bin
> rename to ti/audio/tas2781/TAS2XXX38D4.bin
> diff --git a/ti/tas2781/TAS2XXX38D5.bin b/ti/audio/tas2781/TAS2XXX38D5.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38D5.bin
> rename to ti/audio/tas2781/TAS2XXX38D5.bin
> diff --git a/ti/tas2781/TAS2XXX38D6.bin b/ti/audio/tas2781/TAS2XXX38D6.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38D6.bin
> rename to ti/audio/tas2781/TAS2XXX38D6.bin
> diff --git a/ti/tas2781/TAS2XXX38DF.bin b/ti/audio/tas2781/TAS2XXX38DF.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38DF.bin
> rename to ti/audio/tas2781/TAS2XXX38DF.bin
> diff --git a/ti/tas2781/TAS2XXX38E0.bin b/ti/audio/tas2781/TAS2XXX38E0.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38E0.bin
> rename to ti/audio/tas2781/TAS2XXX38E0.bin
> diff --git a/ti/tas2781/TAS2XXX38FD.bin b/ti/audio/tas2781/TAS2XXX38FD.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX38FD.bin
> rename to ti/audio/tas2781/TAS2XXX38FD.bin
> diff --git a/ti/tas2781/TAS2XXX391F.bin b/ti/audio/tas2781/TAS2XXX391F.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX391F.bin
> rename to ti/audio/tas2781/TAS2XXX391F.bin
> diff --git a/ti/tas2781/TAS2XXX3920.bin b/ti/audio/tas2781/TAS2XXX3920.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3920.bin
> rename to ti/audio/tas2781/TAS2XXX3920.bin
> diff --git a/ti/tas2781/TAS2XXX3E300.bin b/ti/audio/tas2781/TAS2XXX3E300.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3E300.bin
> rename to ti/audio/tas2781/TAS2XXX3E300.bin
> diff --git a/ti/tas2781/TAS2XXX3E301.bin b/ti/audio/tas2781/TAS2XXX3E301.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3E301.bin
> rename to ti/audio/tas2781/TAS2XXX3E301.bin
> diff --git a/ti/tas2781/TAS2XXX3EE00.bin b/ti/audio/tas2781/TAS2XXX3EE00.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3EE00.bin
> rename to ti/audio/tas2781/TAS2XXX3EE00.bin
> diff --git a/ti/tas2781/TAS2XXX3EE01.bin b/ti/audio/tas2781/TAS2XXX3EE01.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3EE01.bin
> rename to ti/audio/tas2781/TAS2XXX3EE01.bin
> diff --git a/ti/tas2781/TAS2XXX3EF00.bin b/ti/audio/tas2781/TAS2XXX3EF00.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3EF00.bin
> rename to ti/audio/tas2781/TAS2XXX3EF00.bin
> diff --git a/ti/tas2781/TAS2XXX3EF01.bin b/ti/audio/tas2781/TAS2XXX3EF01.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3EF01.bin
> rename to ti/audio/tas2781/TAS2XXX3EF01.bin
> diff --git a/ti/tas2781/TAS2XXX3F000.bin b/ti/audio/tas2781/TAS2XXX3F000.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3F000.bin
> rename to ti/audio/tas2781/TAS2XXX3F000.bin
> diff --git a/ti/tas2781/TAS2XXX3F001.bin b/ti/audio/tas2781/TAS2XXX3F001.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3F001.bin
> rename to ti/audio/tas2781/TAS2XXX3F001.bin
> diff --git a/ti/tas2781/TAS2XXX3F100.bin b/ti/audio/tas2781/TAS2XXX3F100.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3F100.bin
> rename to ti/audio/tas2781/TAS2XXX3F100.bin
> diff --git a/ti/tas2781/TAS2XXX3F101.bin b/ti/audio/tas2781/TAS2XXX3F101.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3F101.bin
> rename to ti/audio/tas2781/TAS2XXX3F101.bin
> diff --git a/ti/tas2781/TAS2XXX3F200.bin b/ti/audio/tas2781/TAS2XXX3F200.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3F200.bin
> rename to ti/audio/tas2781/TAS2XXX3F200.bin
> diff --git a/ti/tas2781/TAS2XXX3F201.bin b/ti/audio/tas2781/TAS2XXX3F201.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3F201.bin
> rename to ti/audio/tas2781/TAS2XXX3F201.bin
> diff --git a/ti/tas2781/TAS2XXX3F300.bin b/ti/audio/tas2781/TAS2XXX3F300.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3F300.bin
> rename to ti/audio/tas2781/TAS2XXX3F300.bin
> diff --git a/ti/tas2781/TAS2XXX3F301.bin b/ti/audio/tas2781/TAS2XXX3F301.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX3F301.bin
> rename to ti/audio/tas2781/TAS2XXX3F301.bin
> diff --git a/ti/tas2781/TAS2XXX8DE8.bin b/ti/audio/tas2781/TAS2XXX8DE8.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX8DE8.bin
> rename to ti/audio/tas2781/TAS2XXX8DE8.bin
> diff --git a/ti/tas2781/TAS2XXX8DE9.bin b/ti/audio/tas2781/TAS2XXX8DE9.bin
> similarity index 100%
> rename from ti/tas2781/TAS2XXX8DE9.bin
> rename to ti/audio/tas2781/TAS2XXX8DE9.bin
> diff --git a/ti/tas2781/TIAS2781RCA2.bin b/ti/audio/tas2781/TIAS2781RCA2.bin
> similarity index 100%
> rename from ti/tas2781/TIAS2781RCA2.bin
> rename to ti/audio/tas2781/TIAS2781RCA2.bin
> diff --git a/ti/tas2781/TIAS2781RCA4.bin b/ti/audio/tas2781/TIAS2781RCA4.bin
> similarity index 100%
> rename from ti/tas2781/TIAS2781RCA4.bin
> rename to ti/audio/tas2781/TIAS2781RCA4.bin
> diff --git a/ti/tas2781/TXNW2781RCA0.bin b/ti/audio/tas2781/TXNW2781RCA0.bin
> similarity index 100%
> rename from ti/tas2781/TXNW2781RCA0.bin
> rename to ti/audio/tas2781/TXNW2781RCA0.bin
> diff --git a/ti/tas2781/TXNW2781RCA1.bin b/ti/audio/tas2781/TXNW2781RCA1.bin
> similarity index 100%
> rename from ti/tas2781/TXNW2781RCA1.bin
> rename to ti/audio/tas2781/TXNW2781RCA1.bin
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
