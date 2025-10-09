Return-Path: <SRS0=Z7sO=4S=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641E4CCD18C
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Oct 2025 10:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A1BDC113D0; Thu,  9 Oct 2025 10:19:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26543C4CEF5
	for <linux-firmware@kernel.org>; Thu,  9 Oct 2025 10:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26543C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996ELOo029455
	for <linux-firmware@kernel.org>; Thu, 9 Oct 2025 10:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oUDIhSQeYTAmMI2x5Oeden
	uf/D64HVynpMo7nfkzLb0=; b=Ok4c2zv4o4lksEmxHJY4glOuKUaSm5OljnII/s
	+UVFMZ15NXIGnSFzcKULG9MVF9KzdsZJqzNbqOWQWH7ADxyhJpSPujJ/Ei1UU/6K
	3Cwg287FIZJnRXb/Eth+SfUdCX4xkTXs3jsgiTTSE14yyqtNEnWml1+OtgUg6weh
	i6l6vnWTPe530j/e9ZGl7oWjfilPlXebKG7ZMdkYXKOUCzgNuHI6lJsXDfvmmTra
	cOVz0oFvuBQJ+guvAEfcqDmtJbmJ3INvVzzeNuM7xohLyzp3QbjuWehs9w2SJ8h7
	Cc3SQ2zrJ/BxGfbvCR3ARxIPliuTX8bLfZhLnSLqPh2+zTFw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4njcu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 09 Oct 2025 10:19:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-332560b7171so3062640a91.0
        for <linux-firmware@kernel.org>; Thu, 09 Oct 2025 03:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760005170; x=1760609970;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUDIhSQeYTAmMI2x5Oedenuf/D64HVynpMo7nfkzLb0=;
        b=VFU0b9QdJh+Y5e6ajPgUYjFafkzGx/YQWF39ZtNh82tU40+5YdITU3crjHfc1c1zP1
         gnrgIM9XLTwpstR/jAS9UQpqRiqWxWf/UioK1YVa120www3lbFcrHYhgKEbydlonOU1a
         6NTUuHe4kUuDTdp4H4ftA/y+Q06kehL8oh5Q0YOzuXd/Z4u5MhiorWjnbBHPfMGl0v/q
         77QpxHAPXt1g/nO4710ah1cBIx8NfO9mETZB1SCklla0tfMLgdPtOZ26FFC0R0w4T0EK
         YiwLqvlF5J8ArjBGuXyFcNRsHre3bAGCGIZ2bCZsdcNUjYTNLgQcQyj9/ZvjHXw7opun
         x7Ww==
X-Gm-Message-State: AOJu0YxPMfSWgPhJLxHe5mTRYnP31uY6uOUthWjih0GWJxavHqX/t+AI
	nb7GkmY50JCJSK6AIOc3u4/Y+ULgiWozvDymCdspiZXsUbqkXetcy5SWCxdWVz2W9GU87n+Y8Wz
	eFaMrmJweyGzqUskyGpg/UJEYLeYEjD5ny/zdZEgF8ryZ26aG5q7Z9Q9JcWprPyNRp6Q2H94=
X-Gm-Gg: ASbGnctXLa0an+oQ+AZfTsXEjxfUCD+9qT0+Zru3T5XZAGusCMnSBcjjlqCTxe2k8Os
	SZwrWU4kLwJm6V3xX0flNZI1rUHto8dRkG58Jccs8+DPDzBiYl14bM+S2i2N4+FQuNnfzjCTviF
	1PO1YVbW/gFs5M6jRyTY1eZIZ5urKVLzj0ach+uaoq1swpAWao6mRYswsohN+PTmZdj2D3rpsDr
	jU7JpziCzzojdzAL1iUSpYgh7borpFsGOMKd1sGfL9VCi4/Rs3dVHhqsREaYIZnpzyk1b/NTQGW
	i+dE8tjPSAQw48KCh7jeZ8DKE8hW2Q6LgBK8eSdpqRv9zhbUVZCVw5AaOPv0UUwBSkSbK4NNpga
	qpXlZ38AetPEjMDVTmmD+LRxbaD6dmt53Gg==
X-Received: by 2002:a17:903:1a03:b0:267:44e6:11d6 with SMTP id d9443c01a7336-29027e5d1efmr94426985ad.6.1760005170020;
        Thu, 09 Oct 2025 03:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOIczquk1G5k15x4X1Db436TK/8q+hvheDZjWf8Lq/ZVf1Rth5WvFAIsbFmgazm//R6xkVaw==
X-Received: by 2002:a17:903:1a03:b0:267:44e6:11d6 with SMTP id d9443c01a7336-29027e5d1efmr94426575ad.6.1760005169477;
        Thu, 09 Oct 2025 03:19:29 -0700 (PDT)
Received: from [10.133.33.50] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034deb0e7sm24110525ad.11.2025.10.09.03.19.28
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:19:29 -0700 (PDT)
Message-ID: <66c935e2-58f7-4c6e-ad4d-77351dcf2a58@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 18:19:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add CDSP firmware for kaanapali platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX78Sk4yftLNpi
 YaIqm6ja9KkQxOhmz12G0YJ62W1KKk2Zv+GOamWozy7qKk6q6T8I85Vi3vuwRv74qTVEL9FURwv
 dr/XQGJA2ClOU0tQMJrYNwFLgcGtFi1UGCd3JEizMevIBsp9DJ8aVAwXhggGHh8R/CGI4I1pcF9
 tWbquTXmLP99+iekii9iUEi/ugLFvRChJD5MFay+Bg1YNaP7/4EtFzy28D4teBOvEJdpvC+HULg
 4AeG87zSIPAX/MqTz8Fn/apyC4Owedagl/82GcXU+r1mre5ZhJo1Z+2K24rwPiLoODZxr7ilxbE
 PvT+/6Kr/bv/pwLcqtCZ9wU/3vQjetkH5y+NtYZW6/G1FWeXxp6LOtXVSGZCzpmssbBK3lBse9Q
 JN1nuB0mn/25R5RgBCGZ3D5a6gVrnw==
X-Proofpoint-ORIG-GUID: KemLJp76uVIPFbMHmuRdrclsmwOI3-Bc
X-Proofpoint-GUID: KemLJp76uVIPFbMHmuRdrclsmwOI3-Bc
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e78c33 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=cEwZFDr00P6gCxZ7DAsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f59034:

   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
cdsp-109-knp

for you to fetch changes up to 235a4d1018bef7fb0d849a36749c910d7c95391e:

   qcom: add CDSP firmware for kaanapali platform (2025-10-09 18:05:39 
+0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add CDSP firmware for kaanapali platform

  WHENCE                      |   3 +++
  qcom/kaanapali/cdsp.mbn     | Bin 0 -> 4956632 bytes
  qcom/kaanapali/cdsp_dtb.mbn | Bin 0 -> 40760 bytes
  qcom/kaanapali/cdspr.jsn    |  29 +++++++++++++++++++++++++++++
  4 files changed, 32 insertions(+)
  create mode 100644 qcom/kaanapali/cdsp.mbn
  create mode 100644 qcom/kaanapali/cdsp_dtb.mbn
  create mode 100644 qcom/kaanapali/cdspr.jsn

