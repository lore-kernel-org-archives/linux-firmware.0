Return-Path: <SRS0=iniQ=65=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37F2E6F085
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB1D9C116D0; Tue, 23 Dec 2025 17:08:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC6B4C116B1
	for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 17:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BC6B4C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBR8JV700440
	for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 17:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Bm2pFy+IjT/7m2m/ZcuZ7ACIB6pKAcxf9XqkQ86r1w=; b=NA5O4tw0L1MuIIUE
	ItA02JOdwIxGnGO6jiz4VaP47OBE/YK1uDxupq35d9Bl7jmp4SWBo+WvGSCqU7t/
	3C6U2Br7XFVh63OpNn+Dtd4fo0e3M4/4536BGKNdV7o3S0+PWQ426A02VUEEgWne
	W5oUwlCXRz+f6K3ZQ2nbvrs2Oh10UmfY4HntIOKcT8+jd7ZHF6Y9ZrPb+/H0xBj2
	80kvQR8uavJk8heIGv2c94yM0GWKlErMa7Nk9lnHEe6EYk8ZIajtubW+ySbpMyKq
	etH3Fs9qJZCOJvNPPPMUBkQv+4WZSKWQR/e1CjgpQdXbbQidIxkq17CMSFoq6baA
	9O0dGA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jryn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 17:08:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5e54cd034ceso8919397137.3
        for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 09:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509732; x=1767114532; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Bm2pFy+IjT/7m2m/ZcuZ7ACIB6pKAcxf9XqkQ86r1w=;
        b=HaSar6UdNE1pgcV5AdLl8jSKuz/pmWG721ngtij6CHInAT1jA1wGOt8pHd4yLx9PA9
         VHYLRnWdR/XpDHeEn6UDtqysrC90vGPKIufEoR5JJSGu46qCsuR3SNT/EAt6BA4I/czx
         dzId8HltSsBkNqZjuypN7jbQrY2vRdhPZWgyqy+iNymN3mA2tLCNNm5re+mr+nGnM2/l
         RvAKM6VnVrBAmeFR0vWPa+KI0MER8DsDmKL4Pz1snk185zlEb+0/aMfReX53B2+VpNw0
         YQcCclD2qO1nJe0Wf5WlldyCIKMMbfUKDq7cfP6kLE64p2wfAm1zXk6hscGXJ0lavMM+
         nBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509732; x=1767114532;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Bm2pFy+IjT/7m2m/ZcuZ7ACIB6pKAcxf9XqkQ86r1w=;
        b=WjYBGLqOpT4nk3TOdewsj3Q8BJL39kiNBdtk1ChBlLFOQfgXxQhLliD+cvvIh8EOPV
         I9cjt+oW4lCe1r1K/Hkze7TvGc0pDs4UjtIyfKy74BJM9NsgtDyKf3D/JbzppYVdeN88
         16uAS2FdxU6G3jf3kY/kIJsmLzdJxfHYfTpvXjRPWNd7vFxLxuuqe6mfkbjLha0UGSXw
         09g4H1zmiR0frJwnkUU4/EXJwkPnoP2AMZydI5nTaxP6jXwRfhx4P4pLbSjCACIcJNUx
         LvjjPTjuunZ2wLmF9vFim5KEpTh3C+7paRwncxREiQ+cKzuYWvssz354mtfRe5O4WTUx
         iRtw==
X-Gm-Message-State: AOJu0Yy0evU0EseMh+BRnWrQUsGInw46NG5fAMafI3UHQ8XYsIFVWY4B
	IbJ1hiVZEznPYZ0Mvdw6dStnc0XfbaQwpLx7+b8+J+aCR0h4G9rtAgCVSveA6iSZrN5X6Qgj4VJ
	uNomjkg0+BeSC+Al1bBVPPZ6ZePLwJtruxGt+SytGeT74LdoqOVljLJEITtjFmw8=
X-Gm-Gg: AY/fxX7UEF1wcrBOXnsEAcjcysWnnmc+/h5xmjCj/3JBZZTqCu2nCpL4JHYvlNXdFPA
	nQofbHxwNVmjb9chDag2lcEn/wgtgBNbad2zZDxjaSMe1cwJmlqpnK6aFlJO4xdm8Zdof+7/0KR
	VVkkC/xaZQdL4/Pbo+rqUtsF63TtXAk61pfEp879WRtw7wPSugblc25na3AjYKvAlL4uDGBN0lR
	PsDqPtXuHXE4Ch5ITKLY/K0rj6hIuRQjaYaEBfEbKZF3UDvdXB8exOG2aSboa0tX3RI2pVQaDaY
	Zml+p6ZhvG4ID0h2vrFWcqjC/uyKrbBGhZ5lNwzPUyvfcIEFGdjVa0tUPgw1nSTfvx1MLmZM+MB
	nrh4Pq/X7y5jZUzCGRidNBppzlFdb7u0Vb9dJe41m7Ui7SHDcFgVXKQI99wLjbKT/DTlraPV0IL
	9tN2EkW31It3XUjiaSEVbOogE=
X-Received: by 2002:a05:6102:fa5:b0:5db:e851:9395 with SMTP id ada2fe7eead31-5eb1a6250d0mr5145662137.7.1766509731987;
        Tue, 23 Dec 2025 09:08:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK26wqwU2fXYr12q7/M8jg/i30sf6Fp6IJbpe+sTauY/uHQ+triiqVHqvzLOpTlYBsyNIvtw==
X-Received: by 2002:a05:6102:fa5:b0:5db:e851:9395 with SMTP id ada2fe7eead31-5eb1a6250d0mr5145654137.7.1766509731522;
        Tue, 23 Dec 2025 09:08:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5f12sm4199560e87.3.2025.12.23.09.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:49 -0800 (PST)
Date: Tue, 23 Dec 2025 19:08:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <renjiang.han@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: qcom: venus-5.4: fix ELF segment alignment to 4 bytes
Message-ID: <cvj6shllxnribxctwhnleevhwtdukrvgj52wsy3vwj6nnw6vbf@ucplfnajqnbk>
References: <339b060a-6dee-41f7-8053-dceb48e5adfa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <339b060a-6dee-41f7-8053-dceb48e5adfa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX1Grzl8dZ40+e
 cEXmVMAwjiPiVGuW+XUwCegih0YAhpnk7xCgK5y225irYpHDBGMDIFLFzfFgeqIgmB1xlw1gwTs
 HQY4LwfL8tFncHNMFdzDhxC9m0mH6kgyOfcXePbLgyQo2cYUToCS5+feo6saJTijCKBdGMPKWTF
 i6Qs0QWnHHWaijMfb2hDTKAf9W4odp7HNtcOglZE4O8nZq4l9rYwTIL2YL3xbttUxT/8Kz8PgMa
 9KY8lFUYHED5WdvNqrM5KchBqkdct1LYsuFZOePduwga00eKKPk71srf/R6B0tDkA+M6dO2bDG/
 99EEB7yrLMNQ50YLIteUdDQMohgFRa9WYm7+/+bUfXvLwyG3/qEiHHQJH4qBcKZ8fH76je9oaCG
 ZCsoNo4SnAODhrM7UYwF0xtb6ayybaZR4JGZv+HbRUiB3FG/c0chOSDPZ8xXusn+x0gnOGv/SjI
 B+o/5WCPij2KYDWdcKg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694acca4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=Q3s_0THPzX8jtQAam5QA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: h8Fbz0slFhcl5iQSL1YjeVDO497C53eM
X-Proofpoint-ORIG-GUID: h8Fbz0slFhcl5iQSL1YjeVDO497C53eM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142

On Tue, Dec 23, 2025 at 05:31:44PM +0800, Renjiang Han wrote:
> Hi
> 
> The following changes since commit 881c549a82203abd9a88870ba27f3e8ce754b2c4:
> 
>   Merge branch 'mt7925' into 'main' (2025-12-18 16:26:39 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-v5.4-update
> 
> for you to fetch changes up to 19b55776b5b5102afd4f9b99f62492315b52fcd8:
> 
>   qcom: venus-5.4: fix ELF segment alignment to 4 bytes (2025-12-23 14:56:54
> +0530)
> 
> ----------------------------------------------------------------
> Renjiang Han (1):
>       qcom: venus-5.4: fix ELF segment alignment to 4 bytes
> 
>  WHENCE                   |   2 +-
>  qcom/venus-5.4/venus.mbn | Bin 922312 -> 922312 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/837


-- 
With best wishes
Dmitry
