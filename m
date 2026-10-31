Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2224F606A322
	for <linux-firmware@archiver.kernel.org>; Sat, 31 Oct 2026 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTypWbyE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjBJAPfD
Received: by smtp.kernel.org (Postfix)
	id 185031F00919; Sat, 31 Oct 2026 20:34:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793478846;
	b=btvIIY6osZYnxXNhCOE2ow6uGJMp3RAb8ct8SeRC0sOliRVuFooAcBN9I+4s+SfLfKLl
	 ZJM/pXm+ZuIFDf+Ykhpo0m6UKMpLA/y3NINq7YBtMf/BylY6x16LfKuRxPopO/zeW6QTy
	 9H9pmcreWQc3gUUsdPZ3ruiyRNHrEa0IfuWlfMMiVvUe4Mblo6E1VfdSJCSCdB149PkZh
	 j/FMUDPsJWXhhhSnOEphjnpwvybq3DmDeMVkpGIY0HaRyqKz2eb+xgYi+JL+mZwtr6611
	 nBcD9IBkvXS2KiDF+Oy9E2wRWeQ+SL7mle+clqy/AkLT+VhMgd8635RPPXHwpo1GU3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793478846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u1+4nnRf1i9Xkva61km0GKadiZZAe35/Fj/lxJjaKFk=;
	b=x0FbNTN7F8SY8LKxWsdxPCyeiI3Y4h/3CFpcDOta3ZO3Xp7klsWTkgf9UzrabgURbAhy
	 jF3CcGxQ/noBv7YnFFdHs80uDpPSp/MYzxxN1lzdMBbu63vCd0U4/EmcUkxIdtPiOB95Z
	 scbDI/dw/w0BC2FKqr00JnQ1dX4hLWnRJTeka2jGJjehGjzrirU2rQFWkPJFLA6K/1rDW
	 Y7S0a2kdYZXclHVth8Rz29mcMOn5QHHVB5oCe7alvZa6K8wddxF7Jh/utGEzlfpfZwbrK
	 g8/HTOGAHx/Yrheby/pNg2VcDVV7UdvzOy7szz85LrZCbfZYPm4yT5JCdy/ucajtlEQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTypWbyE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjBJAPfD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A90B01F000C1
	for <linux-firmware@kernel.org>; Sat, 31 Oct 2026 20:34:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTypWbyE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjBJAPfD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A90B01F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJGEsP3536933
	for <linux-firmware@kernel.org>; Sat, 31 Oct 2026 20:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u1+4nnRf1i9Xkva61km0GKad
	iZZAe35/Fj/lxJjaKFk=; b=mTypWbyE7DNC25uq4Dl6xeMo/Wx5jLwWIV0BytVx
	G0YT3XnJVaVbuSKO937sS06Q9/NSvafcz/5UA1nrevHRY7V6n4I2hN/bHQNh4FSO
	EvEebdai5EEdnDT5G65XUyRGhuYf+3BzcFQNMIycpiTdfR9YTUik5lydlj1Df1Za
	NPteg5GgkUqUs0kRh/Ay1uZnhZAR+Nhx7SEuEc8lhAiYsfOvmBSA7epWt/FdLxFk
	VBwk6Vokpp2VrFA7lS1OCWsTNh1RfN4sNm7TptOW4UADQkhrExoohoeLVijd5rZU
	BTHNh3tOO45ANwInxiSrgmoIXP0LX6ehQYlM44ghSDOAhQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6j4yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 31 Oct 2026 20:34:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso395827285a.3
        for <linux-firmware@kernel.org>; Sat, 31 Oct 2026 13:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478843; x=1794083643; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1+4nnRf1i9Xkva61km0GKadiZZAe35/Fj/lxJjaKFk=;
        b=hjBJAPfD6gUhbimSNRZ5/xNHaSFfqq3QS4tLgc3r2Q3Ahx/PZ4tpzHAU7ZQmFjT0ES
         1BxQLzROhM16IizHhIxA3ZrJv5N9R/01kV6VHtrv82LwmqhOFBuJsRZKNWi/E6YWDm8y
         4IbFUzHlGkQzfFyiajT2DY3yGF/FEXoT9H5Heppx8OkRAhPq9e45CqCHE9tSu/ryMNES
         avtfxvM3GLk9Mm50pAJBjfFN5UhJJ+gt+PbP1XMGd9BsLxI7RD0iwW3Ydcnzx4yCND7u
         ILmRC5rEe/NIGOvIQN3ICXj/n0H+a+vQGxncaKjR5IJMuSpz3nWCHCJ0Zjv6ZsMXVsMT
         vESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478843; x=1794083643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1+4nnRf1i9Xkva61km0GKadiZZAe35/Fj/lxJjaKFk=;
        b=zZwy80clGLTe6Fj3818tq1jF6YIv9CPY9XmxdcnovKdWIoMEbl7cAPVdL1MdvwnEZb
         q2H3NlaBBIKFvmqQDut6thjMwt18lWu1ZegZbLs43TVj3lY0NdIHEPhA9AFH5+YmYuNV
         u8MGcswZXikvkXtKqthMisezZSr0OKJe4vaL/GqcKyJ6LfrcRvrnoAuyj7fklGahTkeH
         xy6+Rjv6btQJFy4VYcO44Ixg7RyRo5C2hRD0+J/uV0hYyFmIt0N876p6qD5xrgEKXmIP
         rS7cGOe9zbyCMvCObYZqn2u8YzM5e6kWKzHXtBUqz4Ntl/H/Gmg7bEkWYsnZFtkIozUL
         na+g==
X-Gm-Message-State: AFq9FYIJn30asAU7PtkwVC7wx2wWYCJ16y7rDUrsFGxNMKDoJkfkEeuI
	iOi+wBXRrQG1Q2tIjjKii0eTorjNlULMP5ZKm6wuGdIzPUrvWv+4Wzsf2Zd/pe2E8fD+n8F6tXc
	JKBZuf01jLlf9GSnm7WSTNa8ry1sGrCLZ7akSMQ9dtXz6ydbQC7FS+TYZDlkU4ec=
X-Gm-Gg: AYBFou2c/Skx3fze5I/85xuUpfrXLplKepaKwnvpYIsC8FHqLJu87y4aOoCMrGmeDaD
	XXH+00M2DGDs3PMSaJvQSgf1moo7y4P5Npq6DF64zmiNfJ+uG1RcDi4q/jmqrYoTqOQobX7pBRR
	9aKaE6vK0h+ZGnFxGySl0JOz12q/R1jy9fSVH7lcWlyol385jizI8VCbvhYvyNVL7Z9bPbsorMs
	egul+nitH2nZmLvgqSzhC2b7nThyaV1/gPoJh3/Nq3o4cjeo79S5beQc5A96cflpcr9MsV3yLS7
	zgGJuoaiMcJyhEdO25PunuGgEdhjjyuhl6YaqqomKIb0C2+sIiPelKZh/+iZ20plke372M1BMYk
	hIlBc0Hx25MuwwROyYp2rCpex5NyGXSzDajkv+mMcQyj8qHDbJPi06+KMhZZWXSvFnN6n9WKs9h
	Leoln/1CsShIAlqRmfm7f0qxGjFach1Nq2KWnJ2cyiHalbu1xqd7bwbVKjyzrUMg==
X-Received: by 2002:a05:620a:2b43:b0:93e:fb96:68f5 with SMTP id af79cd13be357-94421799380mr994235285a.32.1793478842788;
        Sat, 31 Oct 2026 13:34:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2b43:b0:93e:fb96:68f5 with SMTP id af79cd13be357-94421799380mr994232685a.32.1793478842281;
        Sat, 31 Oct 2026 13:34:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd67sm782750e87.12.2026.10.31.13.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:34:00 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:33:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261029
Message-ID: <bfx5k2tljdl4rijelpcwgrsdvk26hf7ajv7pc5o2db73m5sgxl@72mzxbxhgzfh>
References: <1ea7911c-9dc0-4bb5-85b1-9fd7f72c30af@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ea7911c-9dc0-4bb5-85b1-9fd7f72c30af@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CIwTNYHSuBBCq0etrfUNnYb4K1sWZfWu
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae650bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=p0WdMEafAAAA:8
 a=LW1wpjZNjeFz3wEaO24A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: CIwTNYHSuBBCq0etrfUNnYb4K1sWZfWu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX6pkbgdB6B4WC
 rxGOlo5QbnEE/UJeqvhKmv8yxUBaIoudsf9fuc5tZ5nv59oCmzzcM92co+D56gBjZFS81fqRLi8
 C9YC2DYSYQ6YTtdjUnUEY8HXcDxmGb4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX98z4uyh5mF3x
 tdj5A93Zab8ZuVGBcUscjGrQErFe+JVLI4IiPjhJSiNen9uIFlAwTuklhm3ot/NJuYwEMxTc9ug
 9UPQ2qh3hdWSaOpYHhsEpQEVBypFNRbFD/DeCWJfscEtKdBr5YkCufvNcaA9PP9VVLnbw+2ajMT
 W5vykBCVN1Rlp9njh2JOhzvoRDM7NvXpTFXYIfHe/cLT7A+HqtkWW4wDXYq7YiCP7RnbuS+iP5b
 uOQkUgSrk6g7Oh/kjads4MywYCpH2VoKZerVETz2EHvYzM59/is8dHQZ7aCm0Bte88PaiwRmeSJ
 il0/fagtoPyosujKv0eUzbRZMKRTfgoRaAbXlJDGB+n6O9rUWymzs4t22eDGw2nOPkJ+1zk5DhD
 1vzmL5Ctk0W3Uz4QN7lxdpofosFpsNiADzkPFPkiNjsYqMHx+6uH9Xjrm+fhP0UtmG1w9pHTe0Y
 qjf+JCClFHKGYx1Hu9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 08:21:43AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k and ath12k.
> 
> For ath11k, add IOT-focused NFA725(with QCA2066) firmware and board file.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1343

> 
> Please let me know if there are any problems.

-- 
With best wishes
Dmitry
