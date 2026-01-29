Return-Path: <SRS0=xQ0i=AC=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3665CD358C8
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Jan 2026 06:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB4F0C19422; Thu, 29 Jan 2026 06:53:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08F78C116D0
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 06:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08F78C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2pFvK1522537
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 06:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IhLzs90TME3u6QRK70N5QU
	YuQJTBwEk9kc10SZIWwTg=; b=GEawkLyYrSdT+EtpU9npct7UWN7+caQwkJ5hlL
	O27D3u+DmPo+goEjfnaTmglADckVZeCYjSrwN554g7xxThC6WZyZTh39FehI7Pdu
	msMLtMYZPgtPhFjI0dHybYWHfyOV06UqCIYAAT8c5I12stZMmGg2HHwpAgbmrNP4
	Dm6evilvgTWqILdPl2N5v4zJxyVoqngYY6znzOrE2+myqjGlDO14B+/ztJmVisq5
	knf56ZIUjUACFIe2kytmHpDCoXPIXdX7amgk6/CcV12Tl8SnO+qcDf8maDAOUZ1E
	d4dN8CIH8JXbc57Xu73iFi1JEZddEfSCqul+fm7LIO15Sd2A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byjxhu6ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 06:53:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6310f81285so1037437a12.0
        for <linux-firmware@kernel.org>; Wed, 28 Jan 2026 22:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769669624; x=1770274424; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhLzs90TME3u6QRK70N5QUYuQJTBwEk9kc10SZIWwTg=;
        b=GqnFmYzpyDlch7oRuGf/QF1umn3LAtFnb3o11enGieX2Rq3Lk2FabW+Fy030ynMvCY
         4dqhjc4kZUC/+hkZyry4rU/hpDmOZhBFGsHtUcx4C3/ypaPqr/sOhNQmLhvvj5xDfzax
         gXgY5ZNwFdtuGLSozmDlbG9y7I1D7shFITzlY7v3+oHRqvUy/qLNvyajy97vFmCXDOrt
         6IcjFQUjrC44XTaK/TIx/lxIB8617pyFWQniAzu9cvjUAVVvqH0kEFV1hxCMIINJuia+
         2WAqk7lMpYTpb/7Egj6DHf+IXVMdGD95Apfm+7ru909S1J9SqQxWSPgQi2qFGVy1gC3E
         zz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769669624; x=1770274424;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhLzs90TME3u6QRK70N5QUYuQJTBwEk9kc10SZIWwTg=;
        b=XPlcw9fy7KasDV5CbCjqa0hbspLYkA3ge4J67tCaWyWwdI3aQp2k3bet5B7xpQg4Yo
         RlS2Br6cpIQ2Y8J1eBLLxcJSL1FtLGh+ICYcLh2LIREVoa1gAoY7ldfvH5XGhcquFzPO
         /+aoESIsrbxvDaeBXaTCfUqVuP0PktZ/laBN02tkQpJop01ats3BMNkgIS9DnbM+I5q9
         HHa4u/jUgi5q/vOMchw/Pb5CHvigc7hPBFXE2Cjw1ty2oAlDeLRWRTzmM7xPW4KyfW7T
         fb+HiWva94/tClXTz2Twm5PwX0D67LCjTcd+ooafENTkC8HeKfDkxWnL8rq/sIafYhrn
         W8zw==
X-Gm-Message-State: AOJu0YyEnz8d7+uIZVg7fFN3XgjzE7ebMg1O7B9scsElDqidVwoZk+CU
	4z9KwbnVgQCuObzQJTV/474J/Xfrasl9J2/uZyHKlxzP86DaqefiHq9oXPHtCgrkIUZTyySYMAa
	oFQ/4aa296v46KPqcmuMGzpDYTDCcoLsSaz/3FXFHMwwUU0rArJWPGlwPR+BSfi9DCFVtVc0=
X-Gm-Gg: AZuq6aLXZzZhcengPUt+IPRXywEOiI8htU6hSFx5eQ7R7Hpe22YL+Qo2Eky9pB2aUpW
	dRmUzkhh1ob2TVaPu65FqNmaeLxsRmonHv6YMKVUH2vRsQYf9gmaf0Y6CZmbAdDL5q736uooTaS
	Avv4BSHlx2iBmDBEciYVX7cxA/rCdTWwLlfBS4NXMw4MzrxyOpI6UsloIIOPyb1goZI1/x5VbcZ
	Y5Cr9lb0TZ1w8M2Sa2jF4jO34qTJXUsY/UFgIqG0BBTnyPw4lGFHP74pzq804+o0liMWTbiO1XE
	XGzTfJqUV3rxsTXFbIi5P7oH5ldQVct1crCdG2CUo4954TAdONjdb4nSZeNk5fJIFEfBvwX41SW
	WTEm35jmxah/ubYOmPUxCf7MGbaUxSKHUzALL90pR
X-Received: by 2002:a05:6a00:1ac7:b0:823:1679:49c9 with SMTP id d2e1a72fcca58-823691675aamr6459741b3a.9.1769669624286;
        Wed, 28 Jan 2026 22:53:44 -0800 (PST)
X-Received: by 2002:a05:6a00:1ac7:b0:823:1679:49c9 with SMTP id d2e1a72fcca58-823691675aamr6459720b3a.9.1769669623889;
        Wed, 28 Jan 2026 22:53:43 -0800 (PST)
Received: from [10.206.100.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c22419sm4520086b3a.46.2026.01.28.22.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 22:53:43 -0800 (PST)
Message-ID: <01d9e305-f4a0-42b7-ba22-5a9907577b8a@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 12:23:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: Add ADSP firmware for glymur platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gcYDI1a1Da0O9mvMHCqQb1wG4cHoXRvv
X-Proofpoint-GUID: gcYDI1a1Da0O9mvMHCqQb1wG4cHoXRvv
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=697b03f9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=qTSZoGjWxDcAskbA_RQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0MCBTYWx0ZWRfXzBpNndSkOH7w
 K4SHHVjqkI0PFmVK+fPZMEQFq6k7KpLnVXFxvJK4fy7BbIohB+ZmOKE2U6d2VK4Ap3h1ITfPo0+
 ewN3teKvMvaNYrD9jHL4xza6Vw8wrOSBpEYTv9xcTLZZLXqO7B/9mjUxfa0ZpZt9Hl3u79aFly9
 8lAk/LMf8AbTOtgwySWOXsXHy+8Mft36pVzqDSYmtcELgpI7ST24P/EG/thdNZhVzPbcPRE/tWU
 bV5aSHPBs+9kMJCTn/Ga9G55Ylj/CPf32nTDFMz7swF6Spj8xaKVdY0EFsUnKP/xUwuoBGqCHHA
 aaTjTnZcofKbo6SWwSLHiyoNeGXCYYV+zxmU7cF5zarY5F2v91ME72uIFNcBRey7Gzt239KAPCu
 7z6I/e8tYg/mWkFyGHaCICLwx8sa7gUjfxKG2Cj6Jtga9x9ew9zjgQqZMG63QPsSldpU14CASpb
 8PI68GbmyqXvGodm36Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290040

The following changes since commit 0882248d05045565bfefe1f07cbfc22276c9f058:

   Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23 
19:26:31 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-glymur2

for you to fetch changes up to 6b573904745830699030541b01003e6fd1ca294b:

   qcom: add ADSP firmware for glymur platform (2026-01-29 12:15:54 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: add ADSP firmware for glymur platform

  WHENCE                   |   6 ++++++
  qcom/glymur/adsp.mbn     | Bin 0 -> 18622472 bytes
  qcom/glymur/adsp_dtb.mbn | Bin 0 -> 7253 bytes
  qcom/glymur/adspr.jsn    |  22 ++++++++++++++++++++++
  qcom/glymur/adsps.jsn    |  22 ++++++++++++++++++++++
  qcom/glymur/adspua.jsn   |  29 +++++++++++++++++++++++++++++
  6 files changed, 79 insertions(+)
  create mode 100644 qcom/glymur/adsp.mbn
  create mode 100644 qcom/glymur/adsp_dtb.mbn
  create mode 100644 qcom/glymur/adspr.jsn
  create mode 100644 qcom/glymur/adsps.jsn
  create mode 100644 qcom/glymur/adspua.jsn
