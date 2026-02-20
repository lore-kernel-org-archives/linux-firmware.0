Return-Path: <SRS0=Zcrd=AY=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843C4C54FCC
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Feb 2026 07:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58E73C19424; Fri, 20 Feb 2026 07:44:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5ECDFC116C6
	for <linux-firmware@kernel.org>; Fri, 20 Feb 2026 07:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5ECDFC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5S6Hn3698940
	for <linux-firmware@kernel.org>; Fri, 20 Feb 2026 07:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rcc9zpb9LfUYAJNFOfSbLh
	lU3K1yb7jThlhQm4BlIBg=; b=Jlu3CtzXtH5j84aeo/MR9WUZvcghfMKlmVUduJ
	lv31VMwe4G26Gx7NP6IGF5mDuQVazBnqoVM29UeFhb+f2E+YiWw2NnFe9BVD5gIX
	xirz3VLZQArRrdboWRDR8BUfyZoEAtwAb3zKNqLsFTBdsGEmvd/ln8ePZVhdPp/r
	BN1M17LvDORrOJbzAUGoYw6oZvDXGrbHm83bQv9bthoC8G6mT1sM32mFbyNreWSx
	TF9VEJFyLYUA8nehkssoQDxZdPzf1MdDhmdqGUgKZA1IbKXjTt12+Z7iywPq0TJo
	feym367cj1lnGsfRwTx1Fs3Bpstf9arYMbWGL091+fAjUXrg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh5jgb8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 20 Feb 2026 07:44:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35658758045so1364839a91.3
        for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 23:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771573460; x=1772178260; darn=kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcc9zpb9LfUYAJNFOfSbLhlU3K1yb7jThlhQm4BlIBg=;
        b=Lop8rFVExtsHNQBSpMOKPyQR8RF8xeJmqhsx4Sg3u606dtZusP0BfbIakASWnERXc2
         buzMhgkqaNNQSkWFVgYvb26WcTPbMUT5O2sEs8XWs5VYEzuQA11n1VjhARsrVom9vKFx
         PFdt0EdG8vQY0xF8bVzXefQ6LqW+ueE6cBh5gckNbge166xvx4CrwLTgNAmy5bOWwzMw
         Xjgnuwd4GHFZNhpcSxIRSwB4b4pyBGlHJz125eyoALWHFYBqQDGBOWTrWpEupuC67frj
         qB/ZQcvSB+rO0FD3gFoTBzmI5cv2/hurP6Y9zL76dEV3HIC+1WpFGPbWFiaN25eZeIAZ
         Wszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771573460; x=1772178260;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcc9zpb9LfUYAJNFOfSbLhlU3K1yb7jThlhQm4BlIBg=;
        b=hA+OX1CNhuYNHEzE1UkkEFu5UAj/jK1bn9VWCjZupy8qy7DSHxuwbmxHt5eThIjgPB
         GderAeYL+1Khfc58NCq+eD4gqLu60b3jMlXV1DQ59ETFxO19nI3OUHSjCYE6q2WzlY2+
         1P0VJEiNU0CP4zo0YP2fEgE5TFme0sQkug2VR/TcU8KCY0rPSMR8Tbkk8AMGMVoTpUna
         1orovXcI7rUErQ3++QF/sxi8iCA+vNW944Iw526C0OLkVm53sl2jnFHs1PFB8mJRKRgx
         vO4wNPmBsQZz/BkeXd81K4+50DudjBD9mbiT/qeNYr8Fkp0WN94eLoP3eXbmUDwNF+q8
         jOpg==
X-Gm-Message-State: AOJu0YymxeiWIJLRGI7LKncCMKfxiuJUDHpriL1xcI6U1eR2Fjs9X/1a
	6BujwhP//6Jct3jP0cmxLIErgRCFPxOwJ4Zu1Ss01fOIkF7DLjTtPt7bkTPAFH/0WJuqGYHUPrf
	xMQ3DM3FvQGivpmzTGtRHD0e9EBf6SwdBISBxHoYmdur+HQr6hzkk2+huGwxfGPNgjLRogg0=
X-Gm-Gg: AZuq6aIF811huuOs14SRgeFOxXgYESUiCbSl53hMhgRWmiJuXLzoayU83/tJP+T/PGd
	RnGWk+e04CvA8JG3yJzMNGSXMQRnQ64ljzrXTONRYfhDInsm6ERqFmnCMn3kvcDtUuAILV8g92W
	OdH2TwgfsQhs5wbaRfCYkS0+CQzddwomwVtDWcbMx2b9ws0HN0j/MhEPHn335OG9Og5vnR0i/1z
	JmIgS63H3sAJnuUO4uQlVjlNdTuzKxBqL0hmdozXyiLvArAs0dSyz1jfHojXKbyyyMeDkVdr+8/
	+PQvhHcnFBb+haowLm48PdW/YDtxOKl6usWhyTaEbH8kmOB5qglWlOrkLK9CCS3SgmSN6wBotAi
	nHrQ5T6zstZ4oCBRrISMjqs35hfjikfAhBVunIndjNkZOKREHGsI=
X-Received: by 2002:a17:90b:568c:b0:34f:63b7:a1f5 with SMTP id 98e67ed59e1d1-35844f85bd7mr16937610a91.21.1771573459970;
        Thu, 19 Feb 2026 23:44:19 -0800 (PST)
X-Received: by 2002:a17:90b:568c:b0:34f:63b7:a1f5 with SMTP id 98e67ed59e1d1-35844f85bd7mr16937593a91.21.1771573459490;
        Thu, 19 Feb 2026 23:44:19 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d83096dsm2225006a91.9.2026.02.19.23.44.18
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 23:44:19 -0800 (PST)
Message-ID: <3d546c6f-f3eb-c012-db2e-89b4ff1f9f89@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 13:14:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: qcom: vpu: fix SC7280 VPU Gen2 firmware and add compatibility symlink
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raedyltv c=1 sm=1 tr=0 ts=699810d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=vgTJ3uqYKia970mDUHNZug==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=ksynCZEgj2STKheMguAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA2NiBTYWx0ZWRfXwZItMNNkOZNV
 UI+RBo0wtkHWuHKUl9rZup5YqgPhS4yu8PC3eiyRB+d2YYPel59gHf+MdzAZKENxjAxzPJbqO1F
 CMkW1NhkIFFxqA1bdY3BQT92go1/GDLqUN/23BB2c3UYDVWaB4n+joAiitOzBO7aOsaeFjDUkBo
 8OsrAPmQczqGEps3xqW5ALaEF9jLf3MDGZCEa+EGidypum/6J0mhIULnn0eSo7Fdq7qiH6uKz/0
 goL5KdwMrUSme74DRPpOjd7pTlj4TyMbuItAPYjY6e4VkaTe4fnDKnJfHxy80KbZARvWEp8ctuc
 JAa+8zdjUDo9THmI0rGZ5QH2f0PUgG3nxdzB0W8zVj+3PXHB3phU5XW6B/beYI7V0LQv2KjbXjW
 KWqgLSFkBoaVPlBjLU/gb/8rN9IiBZORgN6NlM4kuoMF3ckDMXjU3s6/+ZzOhuu2PtkCPL0u+2B
 Bk4+4glRxeKs0EAKIhQ==
X-Proofpoint-GUID: MoToEP5PAwzdLtLU67rTOKhcY9DuZFp8
X-Proofpoint-ORIG-GUID: MoToEP5PAwzdLtLU67rTOKhcY9DuZFp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200066

Hi,

The following changes since commit f2dbd7a7a74be0d309d8058a55308dcea33a41d6:

  Merge branch 'robot/pr-0-1770355730' into 'main' (2026-02-06 07:17:03 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-kodiak-gen2

for you to fetch changes up to e1e281a6f3b7ac959eb13012020d19084b60ff7a:

  qcom: vpu: fix SC7280 VPU Gen2 firmware and add compatibility symlink
(2026-02-20 12:24:33 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: fix SC7280 VPU Gen2 firmware and add compatibility symlink

 WHENCE                                               |   5 +++--
 qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_gen2_s6.mbn} | Bin 2036328 ->
2030620 bytes
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_gen2_s6.mbn} (61%)

Thanks,
Dikshita
