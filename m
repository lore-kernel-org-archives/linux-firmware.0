Return-Path: <SRS0=8EF6=EK=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DDDCD98C5
	for <linux-firmware@archiver.kernel.org>; Sun, 14 Jun 2026 21:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C44D11F00A3A; Sun, 14 Jun 2026 21:00:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781470851;
	b=GI0huDDscA+xmxd75VCzSu1L23QiTk2EksG+92H6XFN4ubbKC6z2yayeqbLH87keQ0xk
	 t46YuchvXXpUbZbPYA01CR+6Xml4JI8blgqK76d1CveOb+E2NIzzVhYiyMRpEpEf7x4K8
	 nWgv1sT4z8b0yIuhlG7pGGwGnp0XKvAXXI5UPdiAksXTJlr5mlLUOz5nSgAAbVbfExee6
	 oicj+k1j8sfQAxpWHC3DSqPhC/0Fbzd0SjTC5pedeLc+Smun37eccyveNxnSLlCTQb4ua
	 igaMHYMNPz++b4943Tmt9PaYWzVY7Khw8nhW1ulKv8kdNpKlRi2+qynmmNVyBW3Hs+A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781470851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gYghOSf0KJF7kNXK9iDdRM5g3SA3kLJXo6tiY5wfRZA=;
	b=kML/84DW2wgMEo4m5UtBINQ0hO85SWpYnSHlMPW8PYomgUqpYNN5g2Cp+SVykde56B5C
	 VDR2zazwI099XojS3nY0FTsTyeO3ydkbHtO2Yw8IadKAn6D57KuSO9HUo69dyDebOZMA+
	 CDr+C30lyJdTPxBwtd/spWRPyMPPtXONzW0eVRO6VRqiGVTQn4CoTdjRRW+jXdxod1wL8
	 7wZZ7xsXolNd7PQfV7HIj5Z/R0SrP8EcMk22JuYFKy94wEjFGLvvdXxcjRKeqcs5s7B4g
	 ciiccPL2dhODDsaGYIyADYrV0FYubKk2JO0rjlLQeTnSwkKFGp/orTPF6ZVWtg5GbTw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlWIp3aG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SFNShzwx;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BA5E1F000E9
	for <linux-firmware@kernel.org>; Sun, 14 Jun 2026 21:00:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlWIp3aG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SFNShzwx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0BA5E1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65EH0irC2245436
	for <linux-firmware@kernel.org>; Sun, 14 Jun 2026 21:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gYghOSf0KJF7kNXK9iDdRM5g
	3SA3kLJXo6tiY5wfRZA=; b=nlWIp3aGsZbuMSL14z5fuRHnvFXXsvDn/bA81YUk
	yheilUk1qZpVx7hq32UBn6RpGJs3BxVW/8cl9uEIMXReMXNjwHHRjDDLhq5KoZQy
	TTSFt88ovp+j04KBi8m1IakAsiczHif/Ep15Mxapur0qG5sxbSFb4AH9OHdKWmQl
	/WdM9LL1gwDyZmh1adQosYu2NItVTBZHDCsmrRVdiFSJ5FIORrzk7dfGHmEkIua+
	Kdfvq/BfmkjXiG52HgY3YNQieCyDeThRdeYVFx1q0wCN64dAzuCxLwAzpMIYQlut
	IuVWCrP19Ozz+Pdxm6bhZTyzL8YcCW6YhKT0s7QrwrDSBA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6vjns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 14 Jun 2026 21:00:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccdfe1ff26so29279276d6.1
        for <linux-firmware@kernel.org>; Sun, 14 Jun 2026 14:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781470843; x=1782075643; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYghOSf0KJF7kNXK9iDdRM5g3SA3kLJXo6tiY5wfRZA=;
        b=SFNShzwxpOrLyRGfCLKMLMrWGfrL41M7PDFG5neM2ecs/5OvdrgFB4h9fVpzGuE/JR
         AfGlWaAxD6/ay5LRgrqQES3rGm/Z7OIh4TW4tBbT9wNVhFuSBJsORoKz2dMlfvSHuUgF
         fc0XiCZ3A8fMVGA50MmZGYpYdmLDjQ0edVnOA8hmtQ7dilMVaDeQTbYksaZS5Dvc63PE
         J8WWO9pQLb5yqmM2uPRTXxtXJzq+CL+iuRW3fujR2eYNzNiG8bxzuNn1rI37G0e3Zts2
         o+FrgniaHuQhwtR/Ku1kKz5bLXZ+CVJASK3cdV7rs2MqZQr38pirwRv7ihkY1eCEh6UB
         6hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781470843; x=1782075643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYghOSf0KJF7kNXK9iDdRM5g3SA3kLJXo6tiY5wfRZA=;
        b=Z5rdUh9InZ5+Dw/3AWb3iejABAcYOifsTsScOm6qoeCWQZd9CWlSibZZLC8PfALF3E
         D/Cw2mU26vFCvw2OOCYnMxGKn0Yc08waSWKpBgOcAJSaU5mM3DB64Dl77P5CpQ5wSQJb
         VbY9qyhXA1w9pEgZjwNFUh+l92vFA4e6CwbPPOd/DjLKptikfrI0f5xfuULnDrHvswPH
         DToSnULpnrvrcu/dKXt5KFTkX7Dtp2GigAHemy8YOdolkY6IHvhFyCOzCNbpwt/9wqNn
         JZX/yqLN46l/UGnreagPX+/s/uXAz74DNm7e7f5efQriyUqpfEUJ0nXZGOYmoB0nrT0X
         WSkw==
X-Gm-Message-State: AOJu0YwXpqwJaUpWGG19kTQFvVufTZJZT4L8X3fGmVPJGkg0/PcVAB1G
	L9BgSMYULl8ggji7ueBHcIFss6HYihA/xLoH9TC7n+xyhq9DyObDSQBhDoxOzmdsEI0sM/b3EZC
	IYmN5Ld3VQ8g7LqzVhQiRkKxfDK66sjlBaKUi8A2fExAQ3myFUiPh9q6iW2YOfWw=
X-Gm-Gg: Acq92OFi0KugZkPe1+G93LSRZDZF6kQiNYiS0cXYm2B0/Lx4vfUeUsGHZSDcluE0fp4
	Nxxv8nkBBqXYzXOrsf/PY+HULHMUKK8QnzjLgPeM1oZx7BS5HJfToVhkfTZXQDZu7qNIl9gbaOA
	0nvUsqdIqnSwV70TUHC1A8duRQoxESSXTQ3mAN6LaSTvm0ZAkEQd3mGWiAS9cdR2fijPK3ZSJpN
	PRACjcG+L4ArCp9AdZZ05eSCiN8ZW7PEJL5N8PUPk8CB1UQ64GLSBsZufFc2Lom3rF9LKviJQhd
	mWJmZIjjKM922BYt0QGc0XpbJP4Q9WEfQRdsV0z4OZq2+vgz+g3ZFiUlx7UCf5HTwqpe1Um3mxQ
	Iydf/Vh4P/4ZAmcJlzAfuZtARKLGKeeRkEpGaGWrO7Vy7xPQdGgqjwcBE5FxbnSlodwqXeis0Ko
	FmE3b5dOczkDAyqbxFjO5hVc8UIMj1HnywyF4=
X-Received: by 2002:a05:620a:2a07:b0:912:a170:265c with SMTP id af79cd13be357-9161bbfd8ffmr1654070585a.20.1781470842460;
        Sun, 14 Jun 2026 14:00:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:912:a170:265c with SMTP id af79cd13be357-9161bbfd8ffmr1654054985a.20.1781470841530;
        Sun, 14 Jun 2026 14:00:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1717b2sm2196977e87.36.2026.06.14.14.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:00:39 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:00:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: shumingf@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com,
        Shuming Fan <shumingf@realtek.corp-partner.google.com>
Subject: Re: [PATCH v2] realtek: rt1321: Update the patch code to v1.10
Message-ID: <2n3s3xmwdwpwmi6gfmyr4vfngsrzyrkv2wcmegtvbbs4go3mhq@pdzmskeq4bmf>
References: <20260612065152.366723-1-shumingf@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612065152.366723-1-shumingf@realtek.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyMiBTYWx0ZWRfX+QMcKrgyp1ai
 sqNLanCBw8/qkQ/Qw649YeQk80U4ADrgFR19FnJu1VyxwyjzxN3SRBnOhsLqmb5WHWgnjIW/1KB
 T9tshf38umwtsPUEmyEDT9kUt/FU+qk=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f167b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=n9Sqmae0AAAA:8 a=1XWaLZrsAAAA:8 a=QNqnQVJi5BhM4FUFWy8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: uxs8ffThBGB9EsFA_Nd3F04SymaeUVIB
X-Proofpoint-ORIG-GUID: uxs8ffThBGB9EsFA_Nd3F04SymaeUVIB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyMiBTYWx0ZWRfX0w8hlEyZQh+Z
 XlbGSc4kX8EK15L5amhGZ/P5Hvhd642qnmBRJEq0s00sOz7pZe41YiYBOqp6mag+16ENhWfIslZ
 hlUaxEUyOtPX6efA0wIdufUCmcKJN/3MSY5XF5E74IMlpARr78hJVnaspojPAqlTz0mXrjIyiYz
 6xp8AAuXim5oOYQ16iuJchHr8Rrtr8O3+Ve6iBTAXHqPr6ag3ULnPWR2BzeOT22VEbqvw/X9Cyu
 bUojeW+dZxeBrKKChLcaTqTC9eY710u6o7++Cs8gKYmf4AtHQFXn7Z7VxSb0xA2XNk3deRK/1kJ
 rUim29p6Qk9D9ehMzwTMCh5DMuuOuKQHBexYlKGUzZtCKzOVMbiYNi1vWI/UI1mv5nu2gQwKZWF
 hXWQ0nZpy3z6kXIxg/4bcgpLwwOqWtyW5YqEfCY3zbf2dQujpVugWbBpCJ4NTo8YAzCdCDkcmAL
 Brt6Rlx/9u/mQNVoZFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_04,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140222

On Fri, Jun 12, 2026 at 02:51:52PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.corp-partner.google.com>
> 
> This patch code will use for rt1321 VA0 and VA1.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  WHENCE                                  |   2 +-
>  realtek/rt1320/rt1321-patch-code-va.bin | Bin 7232 -> 24592 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

Thanks, merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1099

-- 
With best wishes
Dmitry
