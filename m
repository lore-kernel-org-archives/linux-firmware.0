Return-Path: <SRS0=vK2b=C4=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469F8FF8875
	for <linux-firmware@archiver.kernel.org>; Wed, 29 Apr 2026 10:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1534BC2BCC4; Wed, 29 Apr 2026 10:34:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37957C19425
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 10:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37957C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qjQt2016334
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 10:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zbxqd/xpQjw2bUiG//EW3f
	4cxwnWmo8a0qx3BB3mJCw=; b=aqvEQJK6I3N3WRdnoSa6V+JdheZMUQBkm/azOV
	+LeDqKtSLJyFOyMEG5Ihy+yb2l2Vz8xAQMO1y2cTAZ/Wz8hf202fQgW7/KXG7Smt
	QhnRlE1+81UaMf6pPmv6SVeLL20fdThgxWnWs35xW7k9970OhXMYA1/XgaZEzHrW
	8epcPXWE/yI4Rw28vtwA1v+skyHyzqy+08mDNZRX4XKDj2JcUNFkUKDkBz7eFD4C
	ZfNx+PbKdmj3m90PKaQiF3jnYO8OEZugzw4wYKIRiMp5J32jcYiwxMRj+Cythkto
	5UOYMpWJFWvf4CNgigxbTDOJhhKhRB2iqDL/4OVhBpaH9hYw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eebcaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 10:34:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b79f4b35b7so64855535ad.0
        for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 03:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777458861; x=1778063661; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zbxqd/xpQjw2bUiG//EW3f4cxwnWmo8a0qx3BB3mJCw=;
        b=HwEM4OLAaxxbG6tgQx1mwHMkKpDD6vKZdyPY6eNpp+h4ABCyrQJb4x2P5C3r0HbhKF
         O7LIv27wRCxjrmnJmoIBwTP00S6Cb5BMnFjiDNNMLkBTNAxY4n4Z3de/rMpaE5kua1Am
         1hYR0Vsx/H+YniNfyGzmHYXDwGXWTcwv3zugLGXiJQnneiKY8KTaDM6eDgdFukS6Ct3G
         Q+TJsuVM7BMr48ONXkkbtmQ20c60HkciRkzgD+hoTevjFGoW3H6GtDhIOj/0qd62RL3H
         LZv2+SHkvNJvI9TBG7GEz1XCAibsiGzMmKRFi1Ng99tMZLzTv5nsi50QqBBUqfKIXuIK
         pOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777458861; x=1778063661;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zbxqd/xpQjw2bUiG//EW3f4cxwnWmo8a0qx3BB3mJCw=;
        b=qSTdN8h/KbkVVrqOW2/HOJ8e0/6OHlYsJaE2a8jIwAnBteZ4lwibxcRMWwYyCiNUhR
         Sj7UFLpfw6Xat7r4C1syExT4vzaOJsbL0EWwtB8odVV4L5KA9SfMwPBKKEOlkvjcLN0R
         UHxThUZnjVsfDX0owXqKYxbbuy01vySy6rrZ23H6uv3EIfU/0fAttz9oRHVhEXMyboBp
         zMmlzI0OPYY1YRHMo6kyqgSygo88TlICWP075T540KCLyrgPLSpkIjA4Nve8VYrAGj7d
         dgwOaldbcWuPm7uuszWWY+C5Fxyi2191aKj1xA0Pz6KrpaC/+AwE19cXjyIUwFTBl6bp
         ekZg==
X-Forwarded-Encrypted: i=1; AFNElJ99xryGIycawWbUKRadL/ckigPfMltgQRHzybFAL5yLefnkYHDBaOnrJex4+aT6IQfbj7cwRDqRgVvvS76zOw==@kernel.org
X-Gm-Message-State: AOJu0YyPcyyiGFIgmZDJ2G21hDurNdgrDssPzsBfl26llpX5GXvnhTyg
	DDzoGsWRzu38szWwgevl9PTAzsif5BytpOCMP+2UoJBs9c9cn55+YTUxr573JjQsZW2DtEbgtLo
	nLw4b6aurXCCJm4Z5UC6mupdkETGtla4HF9LWGjGwrxjUir4EOYTn1yqgkX4EAXE=
X-Gm-Gg: AeBDiestPzDORAJihD4KUapDZ8Ou+qtZesL/h65jBSwjb8S6G9adCT4ADvEypMJhywP
	vBk5SVH9aHVQSy9HEO7EkefFCwtEHTtXTBZ2It2uaLLZ+ZvsHkZ7CAanfVNfCndM+tH3M/KKsT7
	AWdmTZ4RVX7fgJWP2TOSc6gNLPnYdHBbGeqM/omMfNwEpD8aOdncSTy9IyKvtCSijSp0gwvUErA
	Fu8SGoa1MoHwhlxnO+Y51BZb6Z69B0DfNOmsPDytXFTF4PlvShb6mNwIOwbCTNx0ZXewEaoW15v
	1hUimPVq5GpmDwmgp7LEEIGu8ntoZxK8w25SdnEPteDdcds5RBKbjr3yxURlgNKOSyQRkMBBLbp
	mRbymNAf9Xg4g5kEExXkRfspmBmK49XXNfaqJqXDXbi4IvD6y5Qc0x4IP2lDL
X-Received: by 2002:a17:902:8f94:b0:2b0:6d33:e7c0 with SMTP id d9443c01a7336-2b97c3cbae9mr48345515ad.1.1777458861571;
        Wed, 29 Apr 2026 03:34:21 -0700 (PDT)
X-Received: by 2002:a17:902:8f94:b0:2b0:6d33:e7c0 with SMTP id d9443c01a7336-2b97c3cbae9mr48345305ad.1.1777458861116;
        Wed, 29 Apr 2026 03:34:21 -0700 (PDT)
Received: from [10.204.86.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f1e8sm18314785ad.44.2026.04.29.03.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:34:20 -0700 (PDT)
Message-ID: <8c1f05f3-12a7-4ba4-a30e-6f7de93fdf3b@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:04:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for x1e80100 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1deae cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=8ajDnegf9rhAnwtcH5kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwNiBTYWx0ZWRfX1V6ClBaOVhUs
 K2/IRkYw0+Jx5gplPjg0iT7wARuQxd0z1Bd7QiF937tUYo0rKL1XtupIuvoPDUk3ntsuuPURepV
 2v1Z/xsEy6DKdaxKpLqwQkgK/hiaKaCnLt7m6hr6F6vLSh10HqZChe8TQ4Hnlv8nJwI4U/JM5p+
 V+4xXtZ2eogqCAuaOLjpCuZ8PwDmuAePC6AqYRLR4qCMv6uRhfLXHlVcJD2YGH6iQat0/Lldsxc
 49dgELBKIbsOZA8MGJkjaZHeJsywEU82/8vzZVZ2AQzMVByH5zu0jtxiJV+0TjW1iSYwHgDefvP
 Y1lHeQPdoOPkq6TDP/HmB+y2kpBGEFvcJ3AKQ41ZqxZoL8tKb3rND47mPZM8TmYaxrD3/lhge7o
 yshFGmCgsmKdD/TP79GpiUeCexxxBftj03fiDTxLltrq/URvwVW1dBvRWWvTU1IceY2780FmG0+
 4oF+fjWnOzLNrsRVinQ==
X-Proofpoint-GUID: sasutzRfuKhK2OMm1RYF1O0bYJ6AR3NC
X-Proofpoint-ORIG-GUID: sasutzRfuKhK2OMm1RYF1O0bYJ6AR3NC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290106

The following changes since commit 5b50ca02f586e0e44820d1b98d6c7fabc465b2d2:

   Merge branch 'dell-notice' into 'main' (2026-04-28 17:26:03 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-hamoaadsp

for you to fetch changes up to 66976b75fc8fb85382796bc6830a65df92fa2d8f:

   qcom: update ADSP firmware for x1e80100 platform (2026-04-29 16:00:20 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update ADSP firmware for x1e80100 platform

  WHENCE                     |   2 +-
  qcom/x1e80100/adsp.mbn     | Bin 22452664 -> 17922440 bytes
  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
