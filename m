Return-Path: <SRS0=l/g5=GZ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96B2C624D2
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Sep 2026 11:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E6AE1F00A3E; Tue,  1 Sep 2026 11:06:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788260762;
	b=uviCPwO9yab4S70yJ4IRvmJp3X9QiEnfTHyHgpHisR0gr3J9pp+gZBMWWeCDWFOi0MM3
	 Emd8XDI6N4jxtH78nzrqtAttYe26X5oJTHj9Gg56oJyXYcq8u+319Vrm5uV/WO1DQlbuB
	 64PcPKoCzNs+fhbmQRxn6d0FKRgJk2YBQ8oh4Wn/pIHrE8VP+i7//oCbNJXuqwLJ5tW2c
	 cRK5EzS6iuQSpDSG+jqxyveJqHLumqJwG9xTHhaEG1yuPZXzEjkRsr+tO0tYMGKnHbtGA
	 PrmIZjFD4T6GiryK3FdfPdbyFscw0eQZy9rxVP2+W+hTdQ77zRtBQX9labupHlRxAYA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788260762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mg2/DQ1j6J6EVN2cMDR2fB0PvD5hLpjkLN1NlI1Tpoc=;
	b=GxSSmPvKhuo3pHwk5N4vs86NM6kY3pzBDCU6l33sM3ji8p9LxYOBnwrMPyf9jf3SRBKu
	 s2YI0r5ebGQm53kOFCfbaQu58XzrIe8GwmZv+ESKLtjPCnY/vBl5XHyRnjKHJ+DoD5PJC
	 YKWl/2jSPjPcFfKfZ2q8j8gc4g5m2pFHA29Qa3QqB+UPuSpdEJnwPIaPwaaVXE4ZTWGRr
	 v2l2dtf/KJHgZNOvWDkPe8gLstUC37IVl6+aYpp/9T/oAyom8kSMxpPMzqpBuxHOdQwog
	 xA+eta4ef3BCxmXLhVlfL0DajmH82Ip30LIoqeVhN1Gx/JMoadfI2OfEng54dnPALpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjjeSpBe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOBrRQ0x;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB6381F00A3F
	for <linux-firmware@kernel.org>; Tue,  1 Sep 2026 11:06:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjjeSpBe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOBrRQ0x
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AB6381F00A3F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJJnW2241828
	for <linux-firmware@kernel.org>; Tue, 1 Sep 2026 11:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mg2/DQ1j6J6EVN2cMDR2fB0PvD5hLpjkLN1NlI1Tpoc=; b=OjjeSpBeTt+VZJ9e
	PN+QVrpnQiZAznpD+5Q9j2M8SuYudKnz58WmoUzuH2cEvAqQjnR5fwh/6cPmw/kD
	Q5ZukCVGLphoo6DoiD0Qzxrb8CcdNaX1OH+JaI2QNHTXOkTW1fDLg2wvI93SRxIM
	WA/lNqyrzty3KUZjV2oi5O5RPBi+lSlKpwJX7uufgCp1n5dvbgdvO1hNtBwj4Xp9
	isTJRlxs41yHM8tgD1PCSJYBEKswdVt7qqF0swsSZuIcT1mqR18hZqEYs/lYeyfd
	noIbzS/1PfEV9f1fOTPDEBHiV3GgoKwCMTmkAUGPN1Fv/zcb3/OpxcCG2fe0cggN
	A6Fcug==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm07vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 11:06:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7819910f8adso3921272137.3
        for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 04:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788260760; x=1788865560; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg2/DQ1j6J6EVN2cMDR2fB0PvD5hLpjkLN1NlI1Tpoc=;
        b=cOBrRQ0xxnCJiVcTLmxk/39tRbYZ+5gcP69TJMmdp+F8iiYn8sSsuf9Nt+6oKSYnF7
         q+qR5oemF2oWReFtXtfHR87Frp7roPsH/x2HiXjvkZRkFDhN7+3fqc/AqSU+2CRmPbjs
         seMWhIhnoistTdk1/4zrJsL3/xinHK8kH3jZIWxCdryGW9o4CArxVNwZXhfoDXK2ZOg5
         us6qStgzlVu+mZA/Zb+MmvSqIS65cFlD2JxyrvlTy7ABW80Z/5TjviWnB6rYlDjULRqU
         Rxlc/bvhWCgNLryNsa0YVpkDPM9ahDjsLSGMwdcYGnQ3dUK/X/qXBa42sjz9jedIy7Oy
         FL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260760; x=1788865560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mg2/DQ1j6J6EVN2cMDR2fB0PvD5hLpjkLN1NlI1Tpoc=;
        b=V0u+QFrMBYGeHZEuc0u16zSAwbpts2TCI3PxjGy+Mz5W46vaofnnhZHuxfpVR/7w/O
         XcXqHHkzWQ10mTBkN8Yw9NKjA2PtMyPoYTnJflmNuZWdi1uUO+K7xA7PwIybJYtWmgo2
         wW7dfS1XXZZ/XSdEJMEBcQFSIGVfvVhQag4a4vti7Ca4L2kqFjbDP3f1gKYBwBCwhW2O
         GD1KfbjglsST8CjXt+tPnz3RvcCAz+hrpG6gy7HVTwLZvEK+G30EKIoQ0QGMktofp7Pp
         oZOCRzcCAUjTZDXeT8Zx2Pz8fXvJZbo2zQ2xQhUVVOjuC8IN9nLP3E5NivM0eDUFndu6
         pWIA==
X-Gm-Message-State: AFuF++nhl6ZgM5e3ffditfEHbGMRuJZGEs/wxxKq9AIYW21UABl62iIb
	RwQ2QF8kDNMrptM7HgtX4uQijivEWY/T3UWr3Qgk4VJkHCX+JP6R36BERqzJvwgzDy2xD9eOur3
	Ks0iOBop+Q4XzejSq7gvj14+70CrffVoVb9vkKcSsQyybnTvaXm4TabEnh708bup5Dn4/sOw=
X-Gm-Gg: AR+sD11qX6RwOtTWC57NeGXMOSfTxhPTnKoWbiTwRlIkVMCSN1Oe/bdxwE77O9psH2W
	oa6uv1hIopJE6Z/s9f9s/ZrX4iN/UeT2LnlKyxY7Ox3TBnLdmIyIxTRzWXqP+LQ8kW4z+gxcJNr
	QQ0RHZUmopuS98F21MrdMHuLScYgdVVDgj1Yiz9o4JQbUmImpNGKvRUoamSVMyMryeMHMVTef4L
	Zz3oPOgE+UAwAIGMeAlag4Bqtn/9l17WbE+/D3sN7R6OrJ0tOHNfyuMaLyNS3wPibJ9i+v/DgJl
	nlfs5QuWZfuuNWUZpYyW2CSQ3vOKDS0DoYkUidgUcnG+hiTwXBUqeny+gI/0vXh6iz7jhZDut5J
	rX4sKR8hiCxHmrVMu8lVjIYLjxObtasnEvC9Leteij06llnu0pNk0jYKCUzWAG6+Bcih32gvrI8
	Hp5lk/tz3qp6ru
X-Received: by 2002:a05:6102:8481:20b0:785:b0ac:54bb with SMTP id ada2fe7eead31-785b0ac57a5mr8133023137.7.1788260759742;
        Tue, 01 Sep 2026 04:05:59 -0700 (PDT)
X-Received: by 2002:a05:6102:8481:20b0:785:b0ac:54bb with SMTP id ada2fe7eead31-785b0ac57a5mr8133006137.7.1788260759300;
        Tue, 01 Sep 2026 04:05:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89d3e06sm2783161e87.26.2026.09.01.04.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:05:41 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c request-pull
Message-ID: <os2dizgipn7xbnbgycs3h6fyrcbsk4ybutndexwl5jiu5cd4ax@2xvwaxte5ys6>
References: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
 <4z7ylgqvfizcdzyakkaymp4l6hr5qx2g3tddaqvzfqujecbxye@qu37vrgudb3e>
 <0b6bcc31-1428-4652-9855-4a52ae1c77ca@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b6bcc31-1428-4652-9855-4a52ae1c77ca@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XPfs-uurJUSZdUdgYX4cPtqQK1wOyw2o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OCBTYWx0ZWRfX973nYBvEEoc1
 /B2igBQfMtZ5MADjx20bAlaIdlpVqbz/EEiv5vDtIkJ9Yo+ABDj2fPSdWTnA3tbYHWRrb1dAbPk
 KhYYFpc9EOXqs3hltQXCKJIyQ3QK7AY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OCBTYWx0ZWRfX8RrEBGIvwmu7
 SCzD0BOzePDvc27Ce21yCxmvtp61b+86mTZX9SdGC+cJx2rPCbYwi/6U+DYAGHquoBbmDjs89RQ
 7F2HtmIJjQHZtGZs5tUq3ehPlFtve8UW6GQ52wu9lkFiVXs8JYOGRqBpC+npqzBMDEZZf5sGiCH
 NLMCV2M+Fuy00iMoErW9rIvDO/XAkwuNPBaMvTkmeQnHObQiJBe9ReWILO9GkgRaEp666dsbw9X
 2BJCFSc/pVubw3xjx+FPHMDCSLGgPP2TJkFpIg0yG8RNfvqyDzibXg1+Di+tBRrzujVTZFBFLXE
 vy3hXTuciKau8V3rf/Nwg4aCxCij+LLZm9kDBJlipiMDcjUrTPH8NE7y9HRoUkI5wX810QxvmaD
 fJ6wU6kK0bSKP01u1JG+Npz4qckyEPmIP7b08+oDD+cF+3BX+bka1eJHhcrCyorj0ae8aYx1wMv
 2fkmPn4omvSRLfNfoPw==
X-Proofpoint-GUID: XPfs-uurJUSZdUdgYX4cPtqQK1wOyw2o
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96b198 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=H0R53ft28CqeTrZ6kYkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010098

On Tue, Sep 01, 2026 at 11:07:20AM +0800, Shuai Zhang wrote:
> Hi Dmitry
> 
> On 8/31/2026 8:29 PM, Dmitry Baryshkov wrote:
> > Please test your PRs before submitting:
> > 
> > E: qca/hpnv21g.30c not listed in WHENCE
> 
> Thanks for the reminder. I'veupdatedthePRaccordingly.
> 
> 
> are available in the Git repository at:
> 
>   https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2
> 
> for you to fetch changes up to 2245d3d1eb0593145573a41fa941e4e056031cab:
> 
>   QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-09-01 10:51:03
> +0800)

So, previously it was a link, you are replacing it with the file. Why?

-- 
With best wishes
Dmitry
