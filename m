Return-Path: <SRS0=3xI7=54=oss.qualcomm.com=wei.deng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4208CF256D
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Nov 2025 04:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82EC5C116C6; Thu, 20 Nov 2025 04:19:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86780C4CEF1
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 04:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86780C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJNENcH3382148
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 04:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=llAwkt3VXDhjRFtb1Z93cf
	6mL7MprmywxPGEJ9jNW/o=; b=XC7/qsd8+o0U9JMKWgJJeQk0PFh5UoHbuZjHOF
	5gDxAy2wZle9Yf4qF4K2mQVjlpeRyuhZoFmJCfji+lxtFRcv1IHLXIWOVvb1prql
	LE3KzOmsRRnI4bKlYT7s3+XzkllNp/nEqL6PmvBUF7F/r5ZHdFEqAXIGqI4F3Pbk
	BI5/pphHz4k1VtvSG4paLIXpKMSYS00H/Em+VV9b18yJbXNG0vyH3zEepTHNILn2
	kUfCMPeJSE5FUWFNGUorTEVMzdbzCMSprS54q3SDREOLaqQnzsfXf9N1aU1If8Fq
	m13sPbKBicxCHsgvmwBXdqW9k8+o/lnDoOwiIowttiRzwr8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah7anutqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 04:19:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2ea2b51cfso13187185a.0
        for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 20:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763612366; x=1764217166; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llAwkt3VXDhjRFtb1Z93cf6mL7MprmywxPGEJ9jNW/o=;
        b=eTrqmCbbFdL5QiHKHaazhGK0uMZQM/+LFa4Kk7kvSnaxWpVg+V1T1rYL90mhNrHNvh
         VYPTk8qp809ZKx0LgC0drx3pXeVoxGlbKyr8y4+vcCMShqO2AnxnO9HoQUx+vCdhRdNY
         XlJmGJFKKHRV8CGJyNNts/b8ObwcxeJxKQVuYYUR/pXSfgBH9DGl8LXXOo+5kQA12zfa
         hrhYKXiPglRuhNwz78AVLKOO9EyZiL8GY+2O3T5sY9JBlxcAzGTFvkDpmLVq6eoM83As
         GiI9UE/X+Ey9F6AJf/o5i+a9oXz7DmBgpApiNGfe4h/YSyu8ibCwHlNtWQ5JFE6C0a6g
         IiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763612366; x=1764217166;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llAwkt3VXDhjRFtb1Z93cf6mL7MprmywxPGEJ9jNW/o=;
        b=q9ldxgQYlsdcpKUhQhzqPDIvvOsze4lBAKqdLTV6z30COx+cDstwI/hgLVhP5c2bIj
         PRXvblhMSmavB3z9RBnjgk8eJ8bSsPpYSK/ns883sNQNbhbisp+GxTwwJQjc7sKMBg12
         VT9gm/hmkILGdt51HjAj5ZRhnggHKgR5Zogyi5U4w5gzB7WcC0wNaIlNpKppciv0z3V1
         veee/Qf4nWutiOnQZmdy5Chm+dGRDQrs7+0hLUjfBKJDiKMQayvrjpxOL40wti/cgefa
         bdcdNUMc29qe4A7gp7rc91z+ofi5jJwie3QhNap6/k53eUrSHYlCqP9ja6l3d9XbFQ0A
         MpxQ==
X-Gm-Message-State: AOJu0YyWeS9b8w7zCs7tfVGBW+QVOKM7onr7ILYIGuUlhrGJ7om3sjbw
	TTpiZb3dGcl0vf2K/a1AVJN19EXIMkLwN3OZNZlvR9Hmxmr/kjH1V1W628Y6QWayux51fILvIR4
	au7qppc69rIm8DxILBogYNxunHapGAs4bS2YEyN/6vqxpzS4aWeyHGNy0DSQ7TRZk9YsYH+gOGw
	==
X-Gm-Gg: ASbGnctn2PRkeVOdDLC777t78Iw/QS7HwzKgz3xckBWWzxoEBabB1KO0DncxnBLmkZz
	wdCg3wDpKi2R2Ml9UmzfbZlwuW7AV1jID26NTI62rYMhVJFURSyQbPW+QjdPkLkOiIIwS5F7FRJ
	jS9CbsRbXm/p66sWtw/S0KL7HkfwaJuuXX5XAQlT3DVJvA4Z66b19Lq96c3pzOIm8q0+v+U5Bxf
	hULfAK0NZEToss0j2tri10ZeyBiUPu1ivn9Vz23ppyy7/EfldcgztzaFee/aJQkpZ6I6xevvXsB
	2DVDL9ne2CjGmwlxRfwWcIOsWwihQMC8IdxsdcqF7rHjCv0oV3XVM9cdVLHNyTAfN+6A9RA4OIj
	4s+msm7GH08zkiapzLChoeP980rimElg9z5pvvB0PGOQaLprmLLjsQZAix/zn/svMTEUBFg==
X-Received: by 2002:a05:620a:7107:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8b32747edf9mr193149685a.6.1763612365674;
        Wed, 19 Nov 2025 20:19:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFEYnme+mdABg+FcMHjihyp0q9UDdS/a8gH7GPZO7vvWrM/UWic+1UHTtBYghbiH/FZNezqQ==
X-Received: by 2002:a05:620a:7107:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8b32747edf9mr193148085a.6.1763612365180;
        Wed, 19 Nov 2025 20:19:25 -0800 (PST)
Received: from [10.111.165.185] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b329431460sm81877685a.15.2025.11.19.20.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 20:19:24 -0800 (PST)
Message-ID: <5fd2de28-2bd8-4dea-9afe-0cd7a5d9c9a5@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 12:19:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [GIT PULL] QCA: Add Bluetooth firmware for WCN685x uart interface
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cheng.jiang@oss.qualcomm.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAyMCBTYWx0ZWRfX3HO72zUnpDpN
 jv52CFeWN6+jlRzExuSsh6+OQaWLQaUVARD9RbmPPEY+t/hq9FVAxAcooMllLD0yY9QHgrlkoH2
 oPHAHif6dXuQuxhT4mI44gUTb8xezgxVAfZup6NY2D0HTTu0yyDC0lZBOAFo/90dqUCqI/3hDop
 zjriWZLb9cUxwyZs+J1ENUQZmdYW6CtD/CwqZ57MqHXIF7vKzDLjI73AGK6HI+OYvH/4XQ20EX7
 9Nt+yzP7o3nf+NRxM5eDU0wXCku6kgc2299qyQQLmAv4HxqfHMUiOVqmkMfCUGsjUlA7lw8CvYD
 6Sd9Mo6n0MFiq6zuKgRpZ8SyzOBayVlhCkPfeH/HJe4VctaMFLnjl307+xU4KbOyrlbaclVltet
 WBy2B2C10KEdN6hTamcnyv941Uf1Hw==
X-Proofpoint-GUID: KzH7K03KtXuhgWRBChba9uo0TYVe5gtE
X-Authority-Analysis: v=2.4 cv=a7k9NESF c=1 sm=1 tr=0 ts=691e96ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=QPu7BhsW9huD7Z__LbUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: KzH7K03KtXuhgWRBChba9uo0TYVe5gtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200020

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 8b9fd78478acacccd0cde109b4a3550969f33bbb:

  Merge branch 'dsp-fw-kaanapali' into 'main' (2025-11-19 07:22:57 +0000)

are available in the Git repository at:

  https://github.com/WeiDeng-weiden/qca_btfw.git main

for you to fetch changes up to 94beae96027761e69a54603605b8a9bfd7b71b3d:

  QCA: Add Bluetooth firmware for WCN685x uart interface (2025-11-20 07:24:50 +0530)

----------------------------------------------------------------
Wei Deng (1):
      QCA: Add Bluetooth firmware for WCN685x uart interface
-- 
Best Regards,
Wei Deng

