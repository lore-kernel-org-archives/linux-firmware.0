Return-Path: <SRS0=vr2A=GF=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2BFC5B56A
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Aug 2026 18:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6C641F00A3A; Wed, 12 Aug 2026 18:22:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786558938;
	b=ixBECUnhQTJ2MzQ/Bh5tTtjBY0Nxsl5GGAO6hVVysN/5yxVNnH0WlduPJXhD546BNjl8
	 +r54hr552HDP/StM1MQzMlF9FZ9c7r1TtmQxqX5Qw071Fj9kjARAYjQMeZyCVa78uszTU
	 ABAGD07O2iE/ITlWPQt/3f63cdN5JBk3MtVUvAcOfgy5zXX5ipqMxmvvQ508ABHKmNtOp
	 aQFtqQq4uMbuwSSHz6w962hNj8kASNq205Yz2MPTcgaLnjRnESgwCPSH5oPIZ/roWTGou
	 szHzaqzkTYm2JfpKRV80ruj42Iz1LnNZK7mxn81nvneoAvLzHIY8TVoyPSD3XwxfLMg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786558938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=;
	b=vYr47lLPPuuUsiD6SeZF4CgPoP03OPLNyFf6ZMcnWTCb+2vngOVv+H/gDe96yqqZMS6e
	 wRHWXwH4TbBS5Ubi+E6FgihQ9T8iVnWBwSEqT+Ep0d/N4QSXnSlhzw9NUhFPdmnSkbagz
	 drhUkBmA8N9+Os27E4O+wHP3cAB02aHdVYzNf0Qn87YFfWpWlEyrEeC8nBA1v4us+ohT/
	 TU55PZwvurLkPKTh6oiRnhMSwommUj6mHF5w4GKXuVYOFBmH7dCsVXWPif9rt1/vvfkng
	 zdijh+4mlV7Fc2K6UKvXKaaYxez+KKOJMYHcw9DK1qwYLKBBgQyis273EvHRYwdWyog==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNoO8uTx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kBKqwLVx;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A1BD1F000E9
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 18:22:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNoO8uTx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kBKqwLVx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0A1BD1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8g0j051379
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 18:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BTpDCdHVX8oh2DPLWNozYILl
	YQ0f211QbctU4RV5Ejg=; b=RNoO8uTxebvsNptxCwD3Ns0BjS7IEodYyNlciKAf
	PBFv3TMp4F6Edo9s49akYyP79KoGii8ogmQfP7SCbv5EBgZzM8RUSphkFbYJgiNA
	zrlbATQcMLuEd520TIyKqJQ1iG/kYyXg+e4MyCMOdNT2NdjmgdAB6PUV7+QVLN3C
	v80I+4BHI//muwfwug0CdLzLrHq8LjQf3sTIEJfgA41HMbV13ADjOP1tuLB/r9gg
	fNlpFZ1eAHpcqK8/ibaeEkybHhKbKmtIR6aF7wRxjlLZA2dSzBBClsS0K5qVg3MK
	sYl2E9rxZLA8wRNYPX/XDmkk9g/itU5cjsBYJcNf5ztdKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d2fh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 18:22:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d28f8737eso23991381cf.2
        for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 11:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786558936; x=1787163736; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=;
        b=kBKqwLVxJQ2Ydh8b32k6p7MFWEb5LnADGw+RnJv6QHXSuaQw2ukCeh5QbUvT8mZf46
         frJoFJYQ3Ljb6lTDKJki0FWNrKP3UfJYXjql1MNe78s7RF3RiwHnoU23hKtQjcWtkKUC
         Wo8uaqH6lM47RmXrd9bClFVG4QFF80n2I/CM66PgEoiuj0Kde4RNgUheWwDOEbpJ1/bo
         9LyUartiB/SS5PriSkKxZM2eJB96UZ0+pBgbmz1nhHd9smrz1TufBdoW4K9Xhcde4i3t
         JO2BnvqgAedyc3SGV/S/QcPYZKpDVJvnM4fhxtdYE8cm3sj7hcTtDskMWkqHCPlMSAdp
         8U3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558936; x=1787163736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTpDCdHVX8oh2DPLWNozYILlYQ0f211QbctU4RV5Ejg=;
        b=GCYb3pD6Dv4t0/F39BAzvsEikRCnm/GWP06kaaMCkWi0txczXm+2FoQzh+SB35xt6J
         PI7ACii6zeyxdA/s1tOIkG6oCYcziIcbse3R8l3jIb+mDckHN/PXaGFkO0ikf0gw+XnS
         BHsBxFB+Um3P3/avL/qjTYi1y7Or4v0vLHSEU5qDtHXTe0suJGnTyI/OpajA89apf5/b
         x+d5Zsvw+XRca1xlGzw47ayKISYzCgwBSTzU7g19H62MEfWlHHlmtdSxlki68LABAMyK
         znZpZNqHae+7Rpyi54bGCaJsem1osWk+fyPDcuf0QirHgbtJV455boD/olHTAAGoOXrD
         mSZA==
X-Gm-Message-State: AOJu0YwXH1ABm1SJjg6r3vlJwzjgWj33/TXbIBXyvYqf2L/jrzqg+NOO
	l+lA/8DJyI7G4C5efnS37ypQ8o+QWvsMuohuxzdDCY8OQ8ZieWH/TVepUYFAyGXglF2YWa9o6Do
	evzUZtzxPNUwvg8dcX6+/fYJKZool7kG4tdz+L85H/N0hSOoFV4C3RGkIcOJzrWs=
X-Gm-Gg: AR+sD100dZmbmC2NQmlcToCK+2rTYRttMpLUsIypTbyqvoiDyyI5+behg0U/Z2Y2Kgp
	rw7lm4u1D9Aa/HA6339eWRGm1GoBS2ctyRTsvxhap2DyJMQzc5nJ2Tdk0OmZdKGB8xsurAwuXvh
	NQGK9DYqQlkyCo6UWwkuQFVHvmDkV6XWgaOy6ZW6g0mNSXQDN2WDoHsAfFxloOlroOD4yV+6VRf
	XhqxdfNpiJgqXz2hU8vL7sxV3VjcgUKFZcf8v4do9lz0EBc1J6fu+fU/67fLC+Br2LEINF1pizo
	/5FaCa1EFISSAXrxwEu8xKqux+Sn3g70ZJuy3ZvhPWWdwqEYNsrX77tCbZSG2JM0SCEaa47WRq3
	DF5TxhFlX/Cz7qAC/FNmYDJ4qlcgbSIW43d5O9Bh+FMuyWHGpAWvbqsMLahq/yJLQMSNh4SdYfO
	srv1r5AHOarZ0m
X-Received: by 2002:a05:622a:4c15:b0:516:e249:e30f with SMTP id d75a77b69052e-52d73df0ab2mr839701cf.42.1786558935578;
        Wed, 12 Aug 2026 11:22:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4c15:b0:516:e249:e30f with SMTP id d75a77b69052e-52d73df0ab2mr833301cf.42.1786558929327;
        Wed, 12 Aug 2026 11:22:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d0477desm659199e87.74.2026.08.12.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:22:07 -0700 (PDT)
Date: Wed, 12 Aug 2026 21:22:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260812
Message-ID: <rrkoosnnkdkzgbqzfmpk3uwndoxuvfvanx2kjy7j4rp5ch4rop@wujgojy3qxxo>
References: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JBMHwi_gvxI_2f4oAk7AXhHxpv4j0QFF
X-Proofpoint-GUID: JBMHwi_gvxI_2f4oAk7AXhHxpv4j0QFF
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7cb9d9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfXwZnIov2ZMipG
 /sQWaGXl8GDXbAtRp16bY2hJ0s5v01+4KW1MlBdwHtCrwi3ZkhgUE8ZhMkyUpAHDW5ETEc0Cjpd
 eeV5YZHnGXY8RwtMUE9zHPUWCkrXegoTA3EJUgwg5r9weGTIaip8PFCBX5rYmOFkeWdPLqvgRom
 /2LDJsEXBl/54zzGZV4edyAfcVCYqtPVqT8+fEHk4cR9P0e4jxV8mHO+awC4zIXyKtENhoKPS1N
 86TpEtkT8o5tW4/2k4Q+uuxO26tzmhviCjNMAYnShcywyrUvBtMBiJZkv7hM4P6/aZ6HCRzfFB6
 5boOSSTbOyDSf7Zp1WO/kg1UwwxVfwXH1H5xfXx5i7gW5fAPGsYSp9PSlgIws7D/5r7H5NdTIYl
 7pUet1DpQljX76fibpKOFyCeGJlgDGH2gn2/6Bnv1j85XxS1+7JK53MQq21HmVzttJC/mnjhmGu
 efwlAOxRXrQd7QDIFcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0NyBTYWx0ZWRfX+DzK9ihJm/0N
 DvJP2hkKSDsn/AXzT9fLcmZLex6Y38m2gHqVZK14A+bihy0vCTpFkoyguJU6xgj5oLel3kF9nPu
 zrponmY3BFppFhaPrOQd9mmWkEaYD2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120147

On Wed, Aug 12, 2026 at 10:44:05AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> 
> For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1177


-- 
With best wishes
Dmitry
