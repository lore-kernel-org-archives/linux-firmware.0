Return-Path: <SRS0=qOYC=EW=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1885C43458
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Jun 2026 15:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C04431F000E9; Fri, 26 Jun 2026 15:53:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782489210;
	b=PEPCRIoDfyeUrM/F1DhwVl8edNu+cD6oBHfvomPIuEHSmqbKAu3Ar8Z7cSiOYdckr7UZ
	 S4e8Yg8eTZmWuhMDbHEKHo8lPxCoJEnVjzInE7ZIvIU6jpPGSnW9hxnmE5ocWeUeKktAt
	 XD1C1SgM6jfRbreX0fY3EcUqFmxna1eqIrEZalm9xjO5a12zG/Re2IJEQThmoPFMxSL+g
	 B6ALlco/SJggbWb1gCUZtLahI17kwpbCJiz2p9ono0/59huZfysY0BtWupHlkjfgaClyO
	 gG/Jy+fv3QJcPlAHgqf9nV5rIJz88VqgHKhsn8KNzGwkILkm80LM8cn0fj9aZZXPDmA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782489210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fu6EgktbTQHOcOuDvtR4vHI2/zHo35AU82VllOZ6cAw=;
	b=qL7lLBljlHZJMNZTuqDA7kzhroDySw+R4/0l6DWqRZ9IQQTMZM2SrJKfThJL6n++Hv7G
	 IcRu7/LpS0K53tU2RVMJunRYjSmwKxb84Dtd+dv/dQOPl5NGXRyOL5e1QZpNhV043XXoQ
	 zC8CT5PICzpYQ166y4tvf3vjtTvQIv/RwJ/TbcBWDnHj9eVMIvNL0MYym4cs7jYiYdmjU
	 b3jq6p3GNUncctgzJ42w6JneeNhU3aGdwKJfmZWfC2rTgFOt5PkgCoHQUCOoq1sWVwbbA
	 spDMSZaKuHKxq/zPXku5IeNHszPi7p2gsjojp8Mfz7pQezibNgvQt1mebUr8DGaVOeg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ob9S1V7t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E7XdpWOO;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24DCE1F00A3F
	for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 15:53:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ob9S1V7t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E7XdpWOO
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 24DCE1F00A3F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFigDI1239581
	for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 15:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fu6EgktbTQHOcOuDvtR4vHI2
	/zHo35AU82VllOZ6cAw=; b=ob9S1V7tN7LS5CO5ilO14xBjnhq25nMC28HcE77K
	2DmP+mA4+/XUzbyRIq69QtkM3X3t/EBg6veOXTqn8td+ywo4wXkjD4f8DCFRYbiE
	Dm5fTetgl8OKDU+I6qmEzMTIMbUGmDGN5skomZk/YyBqjNLv9x6c8JkZnwqTS3K/
	1avRpwzwB/2Qjpuw3wqk6IyjooUb43fXfPGRYJQ2oXyvVhwZ3BwAupZxJRC2d/8u
	nktwqxr6li5lYCjEtqJkemnON4gnHLCqelg6jcxMfnW76Zru0iyDg5zKPZGWgaY+
	2k1cMXkztnNht+ij9vofCABKlTK3M5LiBKnpWBSQdx+HBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdu5mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 15:53:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91598af506cso109837385a.0
        for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782489208; x=1783094008; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fu6EgktbTQHOcOuDvtR4vHI2/zHo35AU82VllOZ6cAw=;
        b=E7XdpWOOv3jERNfJylwZb4gpawX84esjrVUCnlGHcVV7wMCXH1s4jq0hXth97nEqBh
         NzQCPEQ/8+xdVXsKzf4xM7LmbCUtNUhqY9Ia6gJCSDFKxc7Pu6RtmMaAZPEItlwLak5X
         7YRdx7yRxs6PKWJ2QQ4uqKifUHnbY2w6/4SYbKRV38hBx7j+xfu+bmB17gMJD5kJKU0v
         9ovvfjIg1hM39HZdChuqf3JqsM89TWT8OUlYTHnkywBHsWHtKngiSK1FhcQ8jHgM9kNP
         hKEd6R93N9Dd7/T5QtsJrS3pupYmAyJIQp8FDztNnDVypt9wunrj2qo1iI00opWxQ3m/
         MpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782489208; x=1783094008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fu6EgktbTQHOcOuDvtR4vHI2/zHo35AU82VllOZ6cAw=;
        b=GczyHV+NIh+cZSCBeJjRU8hhJi9fFpWFdr7Isg7Qb8CcZutDjMUU52VTXGvSZtSUl0
         O7ew0Tzeq5Qw0PTS0BpJBAYDceRefODg+c9poyaRwHkTP0es3h7zuKys/YiGJWb9G0Dt
         2nnRtI6fUd6rAXaQNj4PBBVD8Wdoo1SeehWewByCK3Ryvod0SQOunphQ0+5mKmMBjXEZ
         udgjFfanvIeb2Ip6hEf2sGIAPeVbZuQTRxQwKMBCB1TsYC5O8lUPN3E1wwhDTEix02kR
         3ZXCMm8D+tM8dmjuCxDi0A8sBP7vIKmh2fqwDwrR+qTJyTuGxV+PIFiPKizpdp5eB/QD
         +lfg==
X-Forwarded-Encrypted: i=1; AFNElJ+GnSLWwdWB8huiLOh40T1PWG4o0vqXTZ0BkqLzqKTeyPhxQnaGj05252Q65f59tUxXDomDPU4SoY33kPgCFA==@kernel.org
X-Gm-Message-State: AOJu0YxktHuiin8PbqbrPrG+NV8+AcCBdTFwT02jL0zBunMNPic2t7Z4
	iQwRklAL25ZB0HtsYIoLB08XVuXhfexsCFwaJumorPiJTxyK0RK/PIMRxTiLxsw/ZdHMbRwF7jE
	m7sretH8iy7hQNk0OY1AzUPK7Py5oUKG8B0DXiP/hJwrt6YlXKwuNjcHML2+NiGA=
X-Gm-Gg: AfdE7ckx2/2SvnW0wSwDPpEp3Zb7jVzavi8A10Kb8XZlXBqH4etXkgC9OkFu/5wCrlx
	2wpDROcG2ZTZn5l2nkpjzenVHlnFJfFePh24FT0JPvfpwrf7MNCekGCLFGLUbC8no2CeGdnb8E6
	ekmYAH1DxtG2j0hbG9n8DKi7g7sGvMR7vjqhfSVauYi6hWJHKkOLFTzBCV6pN3qRJB2YLHhyJC5
	8YCBTO2jgKw5bI65zZbZKDyFv5g5qdULFP3gq5rzfYwHE/ldUipIBAucV0YRKM+7iStjk6TSOyx
	7Jvn1f0BrhKCwRzTT1u07fvPvNaYaHdtRtfAbDBPoxztHbyfLN3trTOa2ASSlufUkGI9KtUhMFi
	2CaVHgMg7WanTP4qafEm+6pYFc+syJwjpUqHftmEbSyY3vyeApTMdesMOF3+5kIl38OqKpR/8O2
	suEogSGTUwEWbaPhRT0M3lIqLd
X-Received: by 2002:a05:620a:40cc:b0:92b:67e6:8aca with SMTP id af79cd13be357-92b67e68d46mr85012985a.68.1782489208164;
        Fri, 26 Jun 2026 08:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:92b:67e6:8aca with SMTP id af79cd13be357-92b67e68d46mr85008285a.68.1782489207643;
        Fri, 26 Jun 2026 08:53:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69551195sm3516416e87.27.2026.06.26.08.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 08:53:26 -0700 (PDT)
Date: Fri, 26 Jun 2026 18:53:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Baojun Xu <baojun.xu@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, shenghao-ding@ti.com, linux-firmware@kernel.org,
        13916275206@139.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] linux-firmware: Add firmware for new projects
Message-ID: <4buz3ck35263bouzxzf2bgtk2n322eta6j5kn37r7ttigduhwh@je7ceptmtfse>
References: <20260626110547.23469-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626110547.23469-1-baojun.xu@ti.com>
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3ea079 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=sozttTNsAAAA:8 a=DlMRXyH5PTNZ0_mLLr4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEzMiBTYWx0ZWRfX3F3JSij+GcDK
 G2obBiSv1bZNMXIKL6dhRaD4+/IBFipxGVKftryh4RoqbjG4hBLR3dlIOTcZlDCWUrExFAGi4m8
 0hQjxnO+3/htzqx5XWMAn9+uCj1lU3hZPFkvgoopqAFTyiNt0bNH30C/dCxkvXJRrLMReCwwB9g
 rx7j/hgmeIPzK3/WncKMfQnILEtGa2hOTttZjJjZHAPCJdFzdGYwKnDDpGWQJ+Cm269EoHlAKSY
 0jOdB5b9LNwXd0gCHFe1PhC5jw2zJXj4amlNDM4p76GpyZAb9li35Mkw9ccBmXFUJWmbT8drxUf
 bRHRkBWtPovBTxTJmlrJz96Aa1sEPvX+4t2MB/StRFxAqqnf4sFB2NGgKVQl3lxJMnRZaVrmOnx
 2Zq510+zdL2s/lAalss8eX5uVFfxUA0t1Sf20QMHnkpqOyi+g6BOfyWiPgRECujL4apj2KbW4x/
 df7fFa4nyZ+9H5jh6ow==
X-Proofpoint-ORIG-GUID: Zbbs6rNCc-TTgOr4h4QiuPaPh3N9p5xv
X-Proofpoint-GUID: Zbbs6rNCc-TTgOr4h4QiuPaPh3N9p5xv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEzMiBTYWx0ZWRfX1WhcPD17gtkJ
 6qSrWqXLV03xzu5R35tbmeeITP3AYe0pAiXCgHSSVbp52vw34zdyXzvkhMuhR4X0VMHIQIsXfUy
 unzfeAO44qJGsUdPVPo4CYQIfuAdSFs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260132

On Fri, Jun 26, 2026 at 07:05:47PM +0800, Baojun Xu wrote:
> Add firmware binary files for new HP projects.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  WHENCE                           |   4 ++++
>  ti/audio/tas2781/TAS2XXX8F94.bin | Bin 0 -> 49824 bytes
>  ti/audio/tas2781/TAS2XXX8F95.bin | Bin 0 -> 49824 bytes
>  3 files changed, 4 insertions(+)
>  create mode 100644 ti/audio/tas2781/TAS2XXX8F94.bin
>  create mode 100644 ti/audio/tas2781/TAS2XXX8F95.bin

Thanks, Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1126


-- 
With best wishes
Dmitry
