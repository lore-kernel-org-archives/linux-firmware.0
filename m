Return-Path: <SRS0=bOxx=ER=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC29CDB46C
	for <linux-firmware@archiver.kernel.org>; Sun, 21 Jun 2026 18:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 765CD1F00A3A; Sun, 21 Jun 2026 18:41:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1782067282;
	b=Y1OSNBMq/Y/dB90PP+IIUv7PNANaQ5OJ9kcjU+AGsDobR2MU63Om/1G3o4AoWq99WRog
	 TmBWgBoRb7rGcvVhVO/lCKvSMXRreeypFaMyk6AuODJurX0OQ4gsJIe4wXPX4vbc4BRez
	 lC31Erq0b1KDp/epAmIGkuZUuYBzQOIv2boicevEdZs7Cx7ZKmZTE+f/0BjlPLWublpoc
	 mspb2uCAK4baAMqtrmbF3+8b+koZc73sQYRKvw4PM80JJa/dZOfMr3e+YFd7AP0e+yGMt
	 hqds7nRi+ygTZxlFR/EbCuFT3HukwJERHKpxHXEKIIoBooQVpppOXtXXZO97T31JQvA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782067282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=l9iEXJYaFKiFsJW5dtSoPqNqGK/Lxyux56MnFOnEPCw=;
	b=BT+MSafyrRmS/ANkxylQ8T85ZZfRSIKwrqOHKinAnYVgsN9OSbnjpIVoGwGTmCrGrgDm
	 wwN48F0wWbop+pshqQcuGE5jg2dsUO3QMBrQIyKHMrHOsnVrMgJP/IBBYfBdUF07j4OvL
	 wqzC3eeqLUVtmcoPgMYvMUaSVZr9npf2Ehe2Lxhc3KFbP4gz3eUMCuUpengIe3Kt6n6Jo
	 lWhwEkLq2cGsA4f0/TBm3NOwWFOo3C1OyYD/4EhHCgLIQkIizEXrbRS1ZcFiXI9/xW2jq
	 mjhy7rb5j1zUkVT0xP/KB02shWKGb8IhkUyzsa4HRzaP0mH6MP21NWTcmBFld4PK22w==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YjD5lFjr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BG3pOSR5;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 906B41F000E9
	for <linux-firmware@kernel.org>; Sun, 21 Jun 2026 18:41:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YjD5lFjr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BG3pOSR5
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 906B41F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LHS9qm2914946
	for <linux-firmware@kernel.org>; Sun, 21 Jun 2026 18:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l9iEXJYaFKiFsJW5dtSoPqNq
	GK/Lxyux56MnFOnEPCw=; b=YjD5lFjrxUr8lGaFYIm2ST8IU0wM2HE3I98nmKC9
	1isFQODylhXvWLURoyB8HxvVIKT+fve4q6QL8ickpK5IOvlyJ4GZFK4RyK/NM3ac
	FJyvD2PXW75Wx5DTSJMjOVWAodOYnykjfOzj5duTu8xoAZATmkBueVp8qEH/vUoz
	1hwfLjSTE3dZ4tdbuIC6jbVF/fmIZedAGVE/vlP9tbsLVSzl/4ek4u9evdqtz+z4
	2qvc7xh6N1Eb8sDJ/kP9vhD3zBzI1HpbaGsfi0qCL8u+y0JxdZ6J2sEWrHQSlAmF
	hMt/bHP0fVAZJVPZrf77dhxXvrLcPB1pwp0RcgUC9uJ4XQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewg7mkxqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 21 Jun 2026 18:41:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842211d6e48so4119635b3a.0
        for <linux-firmware@kernel.org>; Sun, 21 Jun 2026 11:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782067279; cv=none;
        d=google.com; s=arc-20240605;
        b=UzePWJMkGOss5e+uO0Qwt5gIlkQT6+qf9IPXnvJRgmll+/Nmp4jUXsyxGdKw9oZx2n
         y7Pu9aPY4rgGU0lT46mJNT28ksUVxA3PIBQmeYIK+RJw/rfgv6w0pBC4LsTQ1DAyADbL
         gvieiXtf2F9pCVTebxXBq6011G6auCR9CcqyyqNS1BJwSSIsLD3cSr4Zrp4GqGHw6/PS
         WwhwQZsK48M2rwUN4xihKnYd4bUbMmK7s1Fmn/12lW+NbQF2KK2nrIXF8UI7IAKwEWot
         rj0AzCzwYZPXeuroNWtshmDCEfi8iUJefDXW1RKMehRRcL6zF2/D60mpa8uUrKcB/CR+
         aggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l9iEXJYaFKiFsJW5dtSoPqNqGK/Lxyux56MnFOnEPCw=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=jgojQ033/WoSLdedkO3gIFntGNtEgCN+HNzCgYy80pnLbMntjOpKXzjiOfqVUJGupQ
         ulv55LaRNlnbthONKiculbCxYtg9m7qyIJyS1IXL38ZiJOGMjoHkZcKl1S54YNxoKRdT
         t7yajlHSYbMxAYYlXhMKH9r4fCzq4w0/bPFu3vT9SxE7UK5KWlzneQcJ7U/lBwwq/+dZ
         qAmlWMbGKQ8Ej/v5o865cwHVyt71D0oUGK7e29Wf3ox74N3vr2szwaP+4+tgvsz7hzwV
         JZHnmkpWXq5O5H8dR4vMaDWx3p0Pyk09f7OBe0Vio3d7jgouFGixXNloxTayjh0U137l
         mtWA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782067279; x=1782672079; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l9iEXJYaFKiFsJW5dtSoPqNqGK/Lxyux56MnFOnEPCw=;
        b=BG3pOSR5Gnou7YKBe36BdM4hhmyVclInbJcC3nuiaAS03/Zf9foFsAmlLFGDZFUXhD
         jMpjL6Z8AD5BNnUM0Al7d+bxCLL9tWg1rQMdo3069H+msq2JA+YBzje2PTt0tsYsAmvl
         gT/ifH3U1h/MH1RRWk5OChAEE+AdcCVJl8RfrtNOeIPOlJthDbAnAqOPICh0XSpIR7XP
         QORPjNDeCB+8FShd5xXqLk0CmI4P7YWZNRD6pL4EmZIq9OzQLb3OcbKGGQN45vymE+ej
         5PRnicAW3ef9WyA36c0Tuni5xqooG78N7LVt5/KKb4kx1HfzV7fUtb6g6YBKpgaOJ5Zg
         zuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782067279; x=1782672079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9iEXJYaFKiFsJW5dtSoPqNqGK/Lxyux56MnFOnEPCw=;
        b=kKaCSbv1nDYpQS+BKGhvVM+G6/dYooQD/O8Aq/3C+FcuBlNbdXQ+qG5BDMUfzFQ/dA
         DPV0Eznd2+MgoB5p6JF48Y//yKhGhceS6fJU9dqPZdXO0pUOVV4hpjC6z6F5R6x/6l+X
         jNmWuvZQ7Jq01b+cje4Z4/S0DNAuzXRAgN2d5VWMVcJtQaTSH0x/kuPMq2YpacZRlPb3
         yyM4XdVtbOH/srG8vkhcjXkwrRNPo9Z9hVMhn6iVt9V5j1tHAXtYLm3QAZzcof2o/y4m
         np25h45VOm4579ia+Egzn1YKGpnNXwX2NMwF65KGeB6QuxXNeKrs/hgKaQuxAY4dAQ+R
         Vavw==
X-Gm-Message-State: AOJu0YzVc1W3T4bhfX/kl3VqfHPsVeW+gxNUD3neMeL84+nQgl92xPjg
	VUmMK20B5RPOgk5tAhWL32OPZ/9ZlLAxrggH30rhGdIB6NQdW+ztX5EgjtLqGGTi1fQbxGQWRTu
	0pCCah1y8onN26NpUmY2Ff3BwlPLvR4n1rp28ErMpAZo59DFLVp5+0hq2oEUxyCUbkWOhf/hS+9
	wCjjBtSxEIRJGKjR8qsYkWWhOLbqBBAqHF0/v0hA==
X-Gm-Gg: AfdE7clbu0bnUIERN6qpxEEjlOMH0G7ILxa2oKT59PepU3N965UELFcTjN1l65fF1yy
	ugTLqhAHHCteMzr0+Cyq71kh84XVz77mZBTA6wU6FcBkWqqE1VlGSQyGv5imtaE7YT0gmVdiujr
	BSAL1bDAEZMc0O6PWiCc/OuQ+v2vx+KuvBUkvBS2OoAbNBaDzI34ms1KsKPryVc+Yjv2dvmOwLU
	5OfMKwgQ9D+28l/OshQWefDe4Y=
X-Received: by 2002:a05:6a00:3d09:b0:845:31a6:d85a with SMTP id d2e1a72fcca58-845508a1efcmr12739230b3a.34.1782067279426;
        Sun, 21 Jun 2026 11:41:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d09:b0:845:31a6:d85a with SMTP id
 d2e1a72fcca58-845508a1efcmr12739214b3a.34.1782067278982; Sun, 21 Jun 2026
 11:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <9fbcaa15-2bab-438d-ad7b-24c2acd77d11@oss.qualcomm.com>
In-Reply-To: <9fbcaa15-2bab-438d-ad7b-24c2acd77d11@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 21:41:07 +0300
X-Gm-Features: AVVi8Ccodhe3S12zjNkDWVF3Za5PrMj7-dGrkAG8_7rNr4Anolpja66xj95Mwlk
Message-ID: <CAO9ioeX_QfiH7GR3wB2mszD1N47EAeq0SAhMqfJoJ0qkrJa3+g@mail.gmail.com>
Subject: Re: qcom: add LPAICP firmware for shikra platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDE4OSBTYWx0ZWRfXy7KWLx0T+h+I
 fSD1iUFURnmoTo/IIWIRo66lBSrC7+9VYav44VyT4mgNS6jF9nQHRqy5CCEzp0k56dON0jTsWEM
 l3lBPHIDOmsbkonT9VcJYRg5GEzm7o9STzAj7Whv3BDA0gtkeEvwhcb47baOZV84DRF7/gpWNeH
 27TEhTMgfJM35nnAWrSKayv/CC48Xn1zPvWd6n5k78A68EjKFLIQztCr5UnH+Ee8N4/slM/knx3
 HfAQzn4/q7Q5F3gxBEahwW2J5szNdbNydT7Ok9iZv/0GeCkVh9CfJiJSXIB5+m8G3UvLEtOuC/b
 BNPbn/eCvS+M2OJJZXMvD+erfChanBdVGT24Abm/pBzl5wa70VzXL1w6+1qwPAwQu6VrirJPoFV
 D1xW1qKiTm+Q1DiykRZAdDvynwHCFLwttW7nNUkJn26UgfUGcSNa0/lW95c7G9DoH+rW7VO+Bkf
 QIIy77wn17RTnbu7ePg==
X-Authority-Analysis: v=2.4 cv=IOMyzAvG c=1 sm=1 tr=0 ts=6a383050 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=An5l4juaxN0w6su-QnYA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDE4OSBTYWx0ZWRfXz22PVOXLg2Xw
 QzQBLBJhI0O2Bw5xwk0KBLe30e6bW+zrjwe3peLBu8kXBJuJQERGRDfpzkaZo78pcuCRMUNlIW2
 /Knven8MM5wD10uKZpaQJdUijmj4c90=
X-Proofpoint-ORIG-GUID: IUfMfhKqg38iqERNV-PKar33kUIpShnA
X-Proofpoint-GUID: IUfMfhKqg38iqERNV-PKar33kUIpShnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210189

On Sun, 21 Jun 2026 at 21:34, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
>
>    Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
> +0000)

Please rebase to the tip of the main branch.

> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> riscfw-qli-shikra
>
> for you to fetch changes up to 40c5a56a42ae319d3ac8aca0d4899f2611623d09:
>
>    qcom: add LPAICP firmware for shikra platform (2026-06-22 00:00:35 +0530)



-- 
With best wishes
Dmitry
