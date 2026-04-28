Return-Path: <SRS0=uxlW=C3=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96039FF885D
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Apr 2026 07:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69888C2BCB5; Tue, 28 Apr 2026 07:32:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91081C2BCAF
	for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 07:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91081C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S42rsT1329478
	for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 07:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kZDfjkr2/nsrzo59miXPHT71
	sGb9rUT4nos0++aJSd0=; b=nnr5NiDX+Dj3Kba5XB0vdPn16AaBiRQ5J1BHYyMD
	uVdsEZcxoljVyZZxzLZNr8XIgdtx8H3i0SQvsv7fzqiiu738Uwlh2XGkSA9AqVbY
	otpOexl3fjbuoxwrQ2buyCR+IknLS3U+MUFk8v/mmBi5zEDV5duA5NG+OcbNqXAe
	5jFdvdrj590IJDhSPRQzoCFUX4j+UIhuRgOuGi2+EukcUx+9JoO5W/O39WUAEL62
	odO5yuFjD4xP4usVID8q9oFGxy+BoBSDNLaPIfQAMCHzEuBrdU/6oFIWnDnbLKcE
	HBT0+KVhWAnGac9UFwishvBcH5P1w0SXUAQiITh7Ic8JTg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhagq9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 07:32:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d9f191b6eso18925458e0c.2
        for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 00:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777361561; x=1777966361; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZDfjkr2/nsrzo59miXPHT71sGb9rUT4nos0++aJSd0=;
        b=UY18I7gYJ0kRq6y1I24sHZnOQDb5YAKAp9eevMTH2iTOwI30//BfohPEjInwXmruA2
         0a+hPOJCvYHdKSsD8pVUUlYEW/tbyC4MzKuGO2soivpJeePvToGgqgYynpx208VkbZUt
         N8k/HMUQ44U2oU+WoWUBeJT9IfQMgDNUyZnzkbjssS5G3iGCLUYgyiukaWtXCWJeJMSL
         p+RRRKiAyRQ7+kLm9HM/8uyT1BmS8MxBZ1nWhSivKsDkw249i0bq4v/Vd1Kn7K1khlda
         YOzzI5h6ObOs0IyrZ3XLXK3RRhtADrWio1exsvVlZRNN1kI1QCne2+jgQsqFHDbeEu6x
         nANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777361561; x=1777966361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZDfjkr2/nsrzo59miXPHT71sGb9rUT4nos0++aJSd0=;
        b=doO0xXOr4qKhn9y6ksZoo7u+DESiaGKpLc61Ytb6djRfKTMDeSyF//P4QvTEgI/auj
         VaFOsyAjL5H4+dcIf+2be6v9Aj4XJe756xyQPxwb8pzCefrUBqs/FBikrvTFTOxGBwbH
         ziypYmkKvCMnYCnZvKsa05WcuIvOhBKjhPOz6Mefp5Okts2ZggTz0N+LffiqGNQYMf5K
         3qpoKmJVTHilrWw4X81Tg4v7IJb+ie9Pp/cc3+t2vsLDL6YA48M5tD/xajKQUl9MckAd
         RczDSgXAE9ie7dv0d0qBdWklY95AFUEOQChofK0aLX1HPCXz5eKMN2kG7TTvzR2wXVc4
         ejWA==
X-Gm-Message-State: AOJu0YxVrvSQ3WLaWv0DmCHe8DFOngmU9krqn5i8DHVa21LSpCcnMMwN
	32jvf/udm1C8ecnDs1vQlFCxilhLjScJ7mL92k/JwO6UAK9oSJDlwiXFuSFBY2+HmFW7So4OgSk
	bgAX+amQanUGEG6NtfYe6kmIAGhtCyRej9iCC1FRGEnCVtoBSjpO3ExOPtUltx36xPTstlMA=
X-Gm-Gg: AeBDieuiObaZpCgNI8ubcK0HXTWcY6Ceua5bNuRZM+Uj7rn83Ogc4e4LPIfKHsfuq1/
	uIDOTHSC+h/IS6OGBC1RhvQAphoDrFAiEYfrpehgBDbtdWKEqvGfUx5ykyPi+oK6YEijn1KDJG7
	lWQ0SrTuupZWUVSIIrPswqrx0vc8WmhRXikRDKUz29NfmOUd0vyF0hGF1IgXV+DU0hiH00v2wsz
	PzjS4QTt3Y7FEN8izkWBxwIm9wROwXJiDR1PtCAxwmZVTWlbRTl+jfUPzdxdw7aBt1Ejn8sxP4m
	WFBA9GOjxRrW3C4Asn69iW+psWe4GOYwuTCYGwFeGIUIcXoHaiQIkNndTrqCpAt+yqHpuEfrbzD
	YVSQmSfGDtTNFVa0rXA1r8erhfD4Z9FHDKCPTqwl6fFtu8CkqhidCOYcHfVO/lRi5YHTVd6SIvs
	aCA0wqaVfi7yKIli4GnVs+Ly195M+zmSrHonjJd9oX5owPUw==
X-Received: by 2002:a05:6122:6582:b0:56e:8afc:de8c with SMTP id 71dfb90a1353d-573a55094bfmr822167e0c.3.1777361561464;
        Tue, 28 Apr 2026 00:32:41 -0700 (PDT)
X-Received: by 2002:a05:6122:6582:b0:56e:8afc:de8c with SMTP id 71dfb90a1353d-573a55094bfmr822159e0c.3.1777361561006;
        Tue, 28 Apr 2026 00:32:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f2e0d9bsm4945901fa.6.2026.04.28.00.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:32:39 -0700 (PDT)
Date: Tue, 28 Apr 2026 10:32:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: qcom: vpu: add Gen2 firmware binary for Agatti
Message-ID: <ukapdnuz5b6hdhlglat4qmuvdol2anvz2kzs3wl5w4qbhga2ha@cozz52iiqjoq>
References: <cd76b0b8-93fd-a0b3-2ef9-6f73885713b7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd76b0b8-93fd-a0b3-2ef9-6f73885713b7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA2OSBTYWx0ZWRfX/WOeDUjXP1kx
 20NBxSd7PEecuj3LdNz1RgGEmqtvw9fcveJroH/UlDaIBMO58rbeCLXtIztS6aZhJJjd5lsgeMV
 k7fewbdgVkfkYzvOLsa8YzZuV4q1ZLkLMZjNKA6Gf6gOXM7sro8G8hzvaxc4dxDFp3/pKetYXdh
 4Gc3Mp110YLTPolV+2zHZwBo7y2a9O7zRY7dS1gm8q74va+Z9VJcw1mJaXbxxRp1yDNYk05hBiS
 SyW7eMP2m4Rx0Z14N8Dk8JlhRf/fhGEtiR1jCsj3CpMPL7zL9t7WGcdNYJtSaM3i6/ijVEijk4O
 AHrmch0cVebfvQ8mmcCg/jJ42cZaIkFVa4w8n8K0TA61DNAjNxuGV+V3PEyNOAudDq6NAFUPpe+
 4JOspZ7Ih+AK0FhteOEhW+UBGAoX/DUsz0qzljuUJjuS7q4A34ZO84mRUvWI2+NZRw+fZaVpNZl
 wL922wdFDxY6Fk8tamA==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f0629a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=gxaJkG1poXktbpkayaUA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: wP5vrnB_qgvzFlN8a3jol7Th0OpDESxp
X-Proofpoint-ORIG-GUID: wP5vrnB_qgvzFlN8a3jol7Th0OpDESxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280069

On Tue, Apr 28, 2026 at 11:45:20AM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:
> 
>   Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-Agatti-Gen2
> 
> for you to fetch changes up to afe7a6049a8bcac291528d400214410d3debe966:
> 
>   qcom: vpu: add Gen2 firmware binary for Agatti (2026-04-28 11:39:21 +0530)

Thanks! Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1024

> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: add Gen2 firmware binary for Agatti
> 
>  WHENCE                         |   4 ++++
>  qcom/vpu/ar50lt_p1_gen2_s6.mbn | Bin 0 -> 1861732 bytes
>  2 files changed, 4 insertions(+)
>  create mode 100644 qcom/vpu/ar50lt_p1_gen2_s6.mbn
> 
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry
