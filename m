Return-Path: <SRS0=Q2Qw=DK=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A107CD4F35
	for <linux-firmware@archiver.kernel.org>; Wed, 13 May 2026 09:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57DF6C2BCB8; Wed, 13 May 2026 09:23:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B33FC2BCC6
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 09:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B33FC2BCC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8m8JL3474679
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 09:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OknLwQGdElle+fXZrl/AvM
	g+cyD1EYgfXblYH//Cu5I=; b=D/rBJILz6wQgTLgHR1P+rI8oW/kHa1JEf1VwJX
	DE8nk1ym4+PATOvAfgyO2ci4xOptQwBIfKYaR7DW1WklnZHRu3/KEimcxoqIw3vE
	8Xm7qgRtZe63JhwNGTmAXIOns6x9y/znMtuHFuaX6y7P32Pg7cBL4bRRK62pO+xI
	2/kaVZqCfdx8ZON8HIz4n21J9SKYpkuCIaZ+7TP8tDMm9+vcOSK5AArg+HNZyE2U
	/x0P7JfcuOI8zhDtNMA0MC3V+lEyT0yiYqBRCYLRQUKJiz/ghl5HzR4dz5lk8nGB
	/mpzRJoAFiQRsXZdLg7yOnBuR/ptS6GXNMGCLLqJp+dghn1A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4184g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 09:23:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso11541799a91.2
        for <linux-firmware@kernel.org>; Wed, 13 May 2026 02:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778664186; x=1779268986; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OknLwQGdElle+fXZrl/AvMg+cyD1EYgfXblYH//Cu5I=;
        b=ZusX/RclbSkDVqtsQG1jnqw3uNKBu6zqxnOvf/twko9UzCYbAntxtOYvOuYNapi3EI
         m0GBc5pan1l0tEEbjqisfrWoE7IFgZXqgTh1BBmXHEN//kpNNVdo1gs57Y+EntzdeQSQ
         qdDBzr7U+NKOCufEuOWJkPls/CIJCcuwdst6GGpzNL5suG96E38vw4jfXC1+1vqLDAHy
         weJIH7AsgP7PCV5XMRKN0mDsRJM+anPyHSdGyFUCS6f2p1hKLDNR6oSCTJkvW0d4CGiL
         i+QksjTgTYF4FbOmH9Luv3qlQ4yGjaGXnnFKcGvfVlS6F9cbmv1qdiAhi4CvhIfUk40c
         HWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778664186; x=1779268986;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OknLwQGdElle+fXZrl/AvMg+cyD1EYgfXblYH//Cu5I=;
        b=DOwiQ/lK3XVfI0ydiZ31WhqpzvlnR0DUcQOE+ixd1G4H0uFaXM7Y8ma+Kq6BRLXNJt
         DCvRWWVVzszAuw4Jwlv3tyqBuV+uZ/a89wA3F1PKadVtfF/ThHigApBJRkSAZsaTC8T1
         5y4KW3Pb3xUiYn42j9DVvij36a27SVot4mUn1gs5yB5yiHMwueyUgSKW31V1qXWvKHYy
         dQArcKmB1VksmYZdv3BUrjTFbh60Q4pbIE9HvNKhctEy1QqJa4Cky/k/1oVzDRU0rapY
         eB+w9EOKY30NKb2m2IUuQ6uuptCw1j85Wi6EBQ5Fu7TCp84XrTu/oZMjHKtBEMe5Af0g
         CbjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DiP6cGPyoJTQuwYZbGUHdO2Pwv6B4l4I9ShFAmnqNELVOQV9t92xsfuyFxshDmEyQ28PCtV344yNV6ZqKyQ==@kernel.org
X-Gm-Message-State: AOJu0YyToTHzIo38hM4JFRrxzliL8kt/VxlqbekFoBPh0CE2dXnTwwNy
	n8TOMCGP3q7y3zYggkceVl4sKcvkFO9YwwpEoNc1zopKDkCozCp8ZL71C/VSXiNvkfQ7XObXjcp
	7iOaEvaOfzvU58uljc81N6BaPJvusYF2JWFDB72iT5kx9n8Q7Hrq7QBsr9YY6kiclhF+DvLw=
X-Gm-Gg: Acq92OFii2fUHarUwZ7FK00aHM7bUeG/VZ2APnFGusK8fzWcN4wyd7jO0gyt+M2FLKT
	n/KgOciANdG+AnTRslO/VEb0TGEX8G+zjlYGmUonpr2p3FFmYyT7w6zIH3qEE0d6LNoOgCCPwwE
	1W1vnqENszi2ExgK2uPxC5GRKmSSDAgTDtozVoIrPHNO7lxUzWSKAqd+xIXZF5O5r4W5w8j5NF2
	eCMTt4DDJ/pfyYvSeeedwnvMD902iUVRalYQVVboh/OxMOQU8t6UXv2ln9It3jPV2Oo9KdxC7Nv
	kj4DK6nkYEKKbgBVP0rDA2uly8QGtyEh9s1MFXY20+eFqqH9vmxuksozbhscK4KlahHMIjYA0CT
	4081Uz92yFSe7j5jYPXtUCREUoGpieMyVetVNlEdEwgwtmpVSCZ8=
X-Received: by 2002:a17:90b:55cd:b0:368:1979:5e8d with SMTP id 98e67ed59e1d1-368f77f2c54mr2064731a91.2.1778664186073;
        Wed, 13 May 2026 02:23:06 -0700 (PDT)
X-Received: by 2002:a17:90b:55cd:b0:368:1979:5e8d with SMTP id 98e67ed59e1d1-368f77f2c54mr2064700a91.2.1778664185528;
        Wed, 13 May 2026 02:23:05 -0700 (PDT)
Received: from [10.204.86.121] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368acc2d857sm2049698a91.2.2026.05.13.02.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 02:23:05 -0700 (PDT)
Message-ID: <88bebbd9-aa75-4e53-975f-021c8642e61d@oss.qualcomm.com>
Date: Wed, 13 May 2026 14:53:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: Add cdsp1r.jsn for sa8775p platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a0442fb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=8nf6wU7wZ6VZlyLmeJQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA5NyBTYWx0ZWRfX9I16GpPIOVFO
 7NtjmHwy4Rd3q1bKmNtd3yagRQ0TLD7h8Sh372wn65qcrVJuSJ7binF/Z6rI+xmS0HIwVG5BMw/
 gaWbJFAuypFtv1lCbDEnQAwygEAp39bF9n6k5O4pbKCj8wXtbyN8USoxzVjoCHxcpBhy8lpJkEh
 KcAWu0DStkpKq3NVhKe7Hx/vxikDFdLyMRsBeW41bKGa1Gpun0EYEBmigPQU2O8in1Dfi80x79M
 o7CJwTVO6cN8nbLgJPVu7DRmDjsYumGWTjHEJSCEtZWY6NinE4Zv2WETtWJgi+Qo26ud9sEkQY3
 X/Ydi96oCF5E8KDGGURA0irNSnhd1OcW9B4kCLR6EoNmdx5jZNlnwH8a8zfZuQqvU419gYFiTc4
 8BgAiz3MwXNLaW3oOCCd5PJn59fm0R6ud0XImeag+LkMb1XvGZhExARlTqdEg7L8e9lUHgCGLTL
 19C9jHKDZAGkXfoUPsA==
X-Proofpoint-GUID: -GDlrTKyJLE4-GFE0mMI-iBCeu5TC1u3
X-Proofpoint-ORIG-GUID: -GDlrTKyJLE4-GFE0mMI-iBCeu5TC1u3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130097

The following changes since commit b965e85c15a94974d4a6390972fc1cbc1bb109cc:

   Merge branch 'amd-staging' into 'main' (2026-05-08 18:54:42 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-lemanscdspjsn

for you to fetch changes up to d2e0a05bbbd1db311383369ddb84bd80e09969ed:

   qcom: Add cdsp1r.jsn for sa8775p platform (2026-05-13 14:49:27 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: Add cdsp1r.jsn for sa8775p platform

  WHENCE                  |  1 +
  qcom/sa8775p/cdsp1r.jsn | 22 ++++++++++++++++++++++
  2 files changed, 23 insertions(+)
  create mode 100644 qcom/sa8775p/cdsp1r.jsn
