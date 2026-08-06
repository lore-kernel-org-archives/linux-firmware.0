Return-Path: <SRS0=isgf=F7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A99C55ABF
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Aug 2026 10:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8223B1F000E9; Thu,  6 Aug 2026 10:36:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786012605;
	b=qDFscmp3LiMfpD6lgBIq2LQZb852QfQWpbNCqShtrpW0ocQ0SQT9n+muZtHwy3t3l9AW
	 H8T8Ki3DXJ9bqjr9J2zn9ywyem4KpCQDnaBvYdNQbrmL15I+7IbOfSxxk+TNVRb/7T8iC
	 JVHRqTXVQFCw53LIMgrNlFgW0kwu4ILZ1dM/fhae1q9rCn32l3ZGBqVP1uI3ZpuVizcbh
	 1zMGOw1jnOFNs+iHV8f8/7e/qVAOjpnObAk5dPYPZLc17xS6S3CdMT+dzmZjN7uO5XNsv
	 gXVAOGf2003L9E1+hG8mb4HkUlCzKkMd9P8Mwnpn1XdIpE0NU9fqBp+tCob5TnOGwww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786012605;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vbCO4s3/ZzN3OMR9yVmbyO0yDikBCxKYNTltlYXBnZQ=;
	b=EkjI070DeZ6I7kO3IkZrCzs9ud5LpwaoiaITLTN6Wfch7RDR7aeyozfzC8Yyat/PLZtK
	 IfFff9BMccxCv7sRTazsJCObt4KvvOoRTvMvP4CpjcAjVzgdWcyYN5bGEPUAWuLj34gtv
	 0OTCK5IC1EE6cmhBBY9XN767K+f+jx0LYsOQbY3d9ooLYrN1biS0LB8lr/CEkNtoqi8cD
	 p1J7JOZnivtTxSHoG5TQDWZ6jYTkTzHXL5YhgcP7l1nPUU9aMIHUVKZDPCmVorE8YmcZ9
	 ZnYrkNCfGhSjm5hQjQmvEL9NOnKDl/eGu4eWOxzKIuxawpm40hzGPXYNQSMngDCfqeA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBJJZPe0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JBoJcm/4";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCE3B1F00A3A
	for <linux-firmware@kernel.org>; Thu,  6 Aug 2026 10:36:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBJJZPe0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JBoJcm/4
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DCE3B1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhnI1277920
	for <linux-firmware@kernel.org>; Thu, 6 Aug 2026 10:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbCO4s3/ZzN3OMR9yVmbyO0y
	DikBCxKYNTltlYXBnZQ=; b=WBJJZPe0kdMcdysk7sO4UOPFUs8NYhF8IG+O9hwv
	YaUxzoMVMs3XifD6by6CYRoQHd9roq9ffpYT5lMBo1M7NG3bL7OWpm3kNAXFbBFj
	sqxThVnbCbPhVx+wLiVa8caTRShTlVB/ebFjRB0roRRkHkTBLtmt9BhM5MTtEiEj
	ao+rWhq1Qet6PCzwVrazixp9ASQ6ar2LNwjfg302ulTQmmGooC2tdiEyVQiVZwFt
	TMJR07W3iKCCQXfDM0Cikw/rHPphgkM9whFPzRvx0RaJsmH0o1xO9aRhhHQIYunS
	SNh4X4gWIMOfUy4sXrMTGHqskhqytxnBXq8GrvVbNILQ5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuehjwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 10:36:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso15298181cf.2
        for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 03:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012603; x=1786617403; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbCO4s3/ZzN3OMR9yVmbyO0yDikBCxKYNTltlYXBnZQ=;
        b=JBoJcm/40Z53v4eag309DtX+kwJaOuVJDHmQYjeJDsCbLNvP4AoyaqlGBJ1sZ5czUd
         mh93Zf054VPKpnpf+8kBu/6VLA+wJy7Qx8iF/8JbOrfHoMScXBiZh8+zTt867r+mXnWJ
         fmiK+q3QMmUTZmsyOCSDh9zyJTzIF9dMF4xpRaB9LDiIuXgGpDS5yIJSLFdF8yDtDHwg
         ctOE4hBj9CGBmeugPC36Yega6OX7u9WFol2IrpkR7R0t5RaYkeIABpN7RUe6ZV30xfye
         AxjLr7BcnPY0nTz8XZfmMk8yi+CnLSLfKfFQVOszDp/o61JtkEHxVNqD40njKhtDleTe
         LiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012603; x=1786617403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbCO4s3/ZzN3OMR9yVmbyO0yDikBCxKYNTltlYXBnZQ=;
        b=RODSKpVFZ71Nwd9BqC4QmSbd3Ir0Oyz8q2j6rTjWo4n6ZBlasvQDgIDgzX0/3d54w3
         YqQw0DjMNV4gSNHNQ1otkWUlkkh0b7s36ih+SF+4DvWtGoyBA0Yq3AS+4gaKNb5tHJCP
         9m0zmerTxJ7bN5uKWxmDPaipoPmek4aZ9+FcWf870XSZdbUAvYcYNfYYfJNIweNbfOCA
         uNO8Q35rUjxgG1uXTTSx5my+ZfWcjEUHse2I50O/GKPF25rjwzsGOX9kG7Q37qLEEE6P
         ONfsPLZlcFz7iaiP7HX6LEeR5zbyR5kSJaTwaekWY1LPApqmh6axfwzYy3d0jbJjZZ3+
         qiEg==
X-Forwarded-Encrypted: i=1; AHgh+RrNfEtttQ9KzrI0iiUq+CDBF4L5B+g4ddQgQoMfLnkgr1i+eFogDy8zuKCvy9mvrS/HaQj0chyfLWnGF6OiLQ==@kernel.org
X-Gm-Message-State: AOJu0Yz/aBZWSnFUHL2MKg9SkG93AFun4uLq5vENohCab6bRkNKKzSRa
	oXbJQAKcu+eDuH+Z92dxYx/RiM3QPe2BMGwEulzEGGP7lmc7RitoAUTU14DmNZHcajlGAaHaltc
	jCC7XyOkV4c5U84IOY0B02Uu7O7bZW1+Z7q6Xwaa+wvS9ykDkOPOENTcSABkx930=
X-Gm-Gg: AR+sD11CdR5bSBD1d6vXieHBneplS/b6rUL7zAQw1etC6IT8A20O3Q6inGinqiRXvIq
	Mnm0eHYTrFOuZUri7HD42qD+LXWjghIZ1AaNW9w9DBfe8/3ixThxjOQsQiWibZ6YaE3WKD6FL72
	TnuE+VqqaS08mK8GpUR8U+OchUicw1icEe/blQ/KralJ6KUOJ9nLh+iFf/ZJhEktct7MLP5FsBS
	6nUKhcuykVwQJ/KQZki0QNVse06HZmuHkppfJaODNAF4vJOVOEndSmZusVUla00FukD1Jb9wOJK
	6GStY1htv247iE+b336WmMaOHk3mIp0eO0MfmEfhpL9NfY8B7InqMRi101vO7evsrH7wRt3j8IH
	ksVvHT3BReUUsohAwUZfJiqeEEHAHCl0Vmh6i3z15fIsgi/il4Loc/WCQorPBpSfekY5DmXp4ac
	OxODFtE3ciNcWIFg==
X-Received: by 2002:a05:622a:4c6:b0:517:642c:8196 with SMTP id d75a77b69052e-52ce5ff0cbamr138225651cf.12.1786012603201;
        Thu, 06 Aug 2026 03:36:43 -0700 (PDT)
X-Received: by 2002:a05:622a:4c6:b0:517:642c:8196 with SMTP id d75a77b69052e-52ce5ff0cbamr138225221cf.12.1786012602755;
        Thu, 06 Aug 2026 03:36:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f623df6bsm639515e87.25.2026.08.06.03.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:36:41 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:36:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "weiting.lee" <weiting.lee@airoha.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, Joseph Lin <Joseph.Lin@airoha.com>,
        Lucien Zheng <lucien.jheng@airoha.com>,
        Albert-AL Lee <albert-al.lee@airoha.com>,
        linux-mediatek@lists.infradead.org, linux-firmware@kernel.org
Subject: Re: [PATCH] linux-firmware: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <2z4ujfn5vqwiqnccxadatux7dktzk3xoc5qahx5gna3jp36d5w@55oazufgjsi5>
References: <20260806095415.1392102-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806095415.1392102-1-weiting.lee@airoha.com>
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a7463bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=JGXwu8-eAAAA:8
 a=ZdEXjVfr67PsjufVvTIA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-GUID: 1ej-tdzIyhnrBsOwB_1fde6THfKrWGFI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MyBTYWx0ZWRfX4Om7Yy6iXmdC
 lbDZyQekjACYE5iRxIbyUtGSPRfYUWgRdPEEEMV0uJr+v9pFayAmfVLSjL3lOYrRGT45hd29kJi
 vf+NrKiqdFlLLlfHiRNqq2S7noK7xc7M921Nw+0mW6AzrjAzJGNq+OBg6a5EDT5qfaKdEtnxiP3
 ktF3SDJFaX7fNMAIvvTqzQqxzYaxHJyHRgQIomEc4pD/JgrrCaZbjjvq3ghpN5udoiC4DKrB8Cy
 VV1TF6EJ5EWKICigyT/u1LqMRuMxPG9iufXh6Bn7m/qRfwSDVNmBYn/wpdgucRpXBUZTe2+FD0S
 szQhdAZaPRaz2dBZr7f9e0s+roobPJ/TA/g8qloNh4+t/3Jg9xKA8hMNLFow2C4JHjPz1lHu0sH
 PqpSdy/8WOYv1B/+Dp2XlvHfHJkTCiqsnmhaCJKo2dhEeldgTzX2Eyilnx6mPUlDPWqDGEXdUi8
 aKtzNfoSzpuEa246y0Q==
X-Proofpoint-ORIG-GUID: 1ej-tdzIyhnrBsOwB_1fde6THfKrWGFI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MyBTYWx0ZWRfXxt9EPtieHWQI
 PuFHAhOzIn85cbbu9+oNRvAGdVlPq1WE44I7846o8BH+lzysi4aZatW9uAnT3qMwiwCAGCYnU9L
 ymbJYeg3JicBxH2n/Kh5SYaqwm8WFq0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060083

On Thu, Aug 06, 2026 at 05:53:59PM +0800, weiting.lee wrote:
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> Version: 26071602
> 
> Reviewed-by: Lucien Zheng <lucien.jheng@airoha.com>
> Signed-off-by: weiting.lee <weiting.lee@airoha.com>

I might be really nitpicking here. Why did you drop a good tag and leave
only the one with the login name rather than a full name? I'd highly
doubt that you have a dot in your legal name.

-- 
With best wishes
Dmitry
