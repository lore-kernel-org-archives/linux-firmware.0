Return-Path: <SRS0=uFsE=GZ=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F339C61DE4
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Sep 2026 05:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65F6C1F00A3D; Tue,  1 Sep 2026 05:44:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788241494;
	b=SSEdZv7Ep+uJLDpJ7n/WjzJDmwDOLGnaYZQtL76QWwS7GmUuYKTiekiev5Su5HNomZmN
	 4HGDRqV+R6UC/ARsBId9KKBz4EeQsGuPwV37lSAc29kCkxRuVkt+RL2RUd/rnp14aERL0
	 WGPzh1e2iT4QzwFDa4O72j8IKvdWg8FXeqqmltcK55gcsA+q66MC3lPHbjPcsiAGdKqE+
	 wHpyYsGC1QHLplVr0i1Wg9oKPvcIWWDeHpgxBh8x8ou4v266ufuyf2tJclbbYjasJ2O7c
	 nW8rm1wOCGprtgUm+yQ6BkfcVJFcK97+XeG6n0hnCOwMBBDZs5QZ9/6pnaIEy9RajDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788241494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J7Eqa0XDCij3JEcEUoZZxOuyh5KJp2SeXT4IGQOZrVM=;
	b=YSHI2OIGR3SLxgGB+iHdyII3JWLXwF0TuuqNsFvVu/0cupsxWDTSkbvuIcE6vJkNSsnr
	 kh3SU7gMxwwDuCwFulwJ+EjL3hQ/s9m+kxgSi2mSsZYQYI2YnWt5954rgSiAo/DZXqoa3
	 vn5Dy8wpXmxh42QwASwPnJgFaFEIyxzJeiOettwuMLu5iM/q6cgahA+KUw5sAZcAYOwNE
	 VapwWwMpdQEA0uAg4qdIRid+Ah2E3tkFgGszaZ5AXOSA690VOJd524OFrc9DRZRYDad5E
	 SwhhMuKQOhqzR+6TpfDhoOTjCdNY2DwDwPQjihUZ2xuTVc45alcBwempcmxNVxEQb+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCgPKBkt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QVbss/42";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB6D91F000E9
	for <linux-firmware@kernel.org>; Tue,  1 Sep 2026 05:44:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QCgPKBkt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVbss/42
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org CB6D91F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6812kCoD1312263
	for <linux-firmware@kernel.org>; Tue, 1 Sep 2026 05:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J7Eqa0XDCij3JEcEUoZZxO
	uyh5KJp2SeXT4IGQOZrVM=; b=QCgPKBktOP3uCTl/RYJh1LE3uOqZE+TXRTBqx0
	Flq7b6vrUNeUPnZqiv9YgukIpWesZZPFUq6j5f5ySzpr++B2Mt2qPXUO6x5DLFG/
	d4ex9kF7mnGqhpUGnYjTv/c8kJPXUkEtTB3Pm6BY5JWNZu4L9bW77AaAL8BSq93G
	8IyhONoYFXlfPVuRttAnFSr+QOQAdzwuWnK5fDsj6q3Awgj1aorYCz85osa9mR+9
	nTvJIIgg//9lwiHArOCl9xhhTKHlQ2AmQSN3DY+vkGWs/ND+5XbSgTuC1CZ8sHys
	2uqT3EFX33R6AaJHNjUef9ja7wP3G9kad9luHJg59y8qUd9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c8n40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 05:44:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so7513726a91.3
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 22:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788241492; x=1788846292; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J7Eqa0XDCij3JEcEUoZZxOuyh5KJp2SeXT4IGQOZrVM=;
        b=QVbss/42HKijl5Z8WTUcFQxAb3EQpnwMvuPvlT4k90G688jOXpAVPv9b4/vhPLDeTx
         AZaV+NCf+uxFH7jfun1OKuMjfxHpYl1G4O/cTvKWAURJW37+IjSigC6hdfpIcMw6wwIH
         ZoVfPxP/aC+KDi8pM8qjiKWerLo63634cOSrURJ9mBTep12YYn2c3PLdb6dJjlzjuL2c
         OyxeQTJZtnk1fMcM/IrsVZh15PPdBnD0Zq5RoOgVM4f5G1r87Qn3vAx8MTR5+4ZFdhyd
         drWyRv+PPrd7qJjesgBhxUOJvL5akgURHKfnxBuN3GxNF9byOXnBV9yX6eiKyZLi1xb/
         h9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788241492; x=1788846292;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7Eqa0XDCij3JEcEUoZZxOuyh5KJp2SeXT4IGQOZrVM=;
        b=E5lRfAY9FZ+xK4l3AfVPm6wdMPdstEuIJXQRCWDejp5rF+0565ejdFmV9FgmOKJST9
         LkwSrZXC+6w88qSmJAN+0CAJd0GQO1Xf/47gQBOYCGXzqh67RMBdWU0T9tYiPROkQL6Q
         HoSmKEO/lbu3+aCtD+SQhJKCxK/J95hemkRAyTbM5TRNvuACCQUgY/ByAShW5xkQoKjs
         A1UAk6I3vDp3SFbtkMICjvQ9y+C4cM+qSkwrwl3ycxxkRXu4HrKilyfVNYMD7IhN2vIw
         +8fYjYthN75Cz4grTEDtPHq5Vn8R2GfW1VbAlRR1ekpNlRSOVz69qqQU5snaV7Gu/HWx
         UpGA==
X-Gm-Message-State: AFuF++lM6sVkSZyTE9gAkoAuttvIYEVePKKx8uGbEE+qY/oHSl46nRcx
	BzAKumY7R5T/Yoji1wrv7zLR90Bb+bhMABBKFYbEcGQRbEqhGNg7IluQ9ZYhptq071KLvmK53Ar
	6XluXRE3EZcz/38qqeUppAztrN0aPW812uSML+BXJw7zkYeV4B7EjnW3gG8z9Qx2ITTZ/HrI=
X-Gm-Gg: AYBFou0AGT94ESrUYxfSvujPYPx+jphDZCa/WDYfl7loFXclPnMzmmL/EGVHM3uA8cw
	9GbkKUjX933b0NzA5F2OXRZujMV6sRAHuDg4QcHcCZRZxep9noSllzHpn0/FcGPAuSqlM5J3Kd9
	imW7s15MZg5LJTW9NjWV5BJS6UHoq0DRheayxkGyihFSNtYbWgP3c2oIIvxa9SQ5cZ6RV/Mf4jk
	S3J4EihvjWSZKfi102aZ63oLg2RgALAyNmRsDipWJ+Egru3DTa5M+D3JU4vVV8BTYzuS7fJPqBn
	ltsS0EkCQrJhL65xpcYlvCzumPeRq6tyf2NN9QR+ajvDGku+RVpLHhbZb+24vkCMPsIefoR4LQy
	vRW4L+1B59j0YrNBhqCnOvD0kEG6SmQ==
X-Received: by 2002:a17:90a:e185:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-396d0ecbdb9mr51966328a91.6.1788241492533;
        Mon, 31 Aug 2026 22:44:52 -0700 (PDT)
X-Received: by 2002:a17:90a:e185:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-396d0ecbdb9mr51966260a91.6.1788241491970;
        Mon, 31 Aug 2026 22:44:51 -0700 (PDT)
Received: from [10.219.56.152] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d77f7643sm7216895a91.3.2026.08.31.22.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 22:44:51 -0700 (PDT)
Message-ID: <993dc3d9-85fa-4861-b9f8-3db807c0b3be@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:14:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: add ADSP2 firmware for nord platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a966655 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=RPipAtgKvHOh5V2mErQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: K1OuKEz3LeYagIIr6FVVm4cN7tLa28_m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfXytTw4Dg8TKx3
 EYMJz+8SysWCcG4STcgasJa9lYpL+m2BvRCQRRTS5N2A9ydP7JesOPjzsDIk9Ihnu+v/z6/3Oan
 ONgfvDvCrgdVBrNqg5RMCQGeyPs0rQQ=
X-Proofpoint-GUID: K1OuKEz3LeYagIIr6FVVm4cN7tLa28_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfXw3z2rmUEid+Z
 YzD7VA9oHQggXLYZ+JfQh1oh4zTevAAVncIpkg3XG51OXzZOwQ4Eing+cIloPRogQiOeY9ALskG
 uNkTiOSxG4ING62xZ1fZehup3LFkZUjFJL1fE1PR2vZDFCXFgGB0d4Zsty90xTa4FBH2AQe2ncp
 y5gLhdqQKf62+XcR7UVlBoi0Sv5MFZGRwqD0l0oYQyXQREip+8J4EXFOZB4z23wSMZyEQo3inm5
 XABzoTjldH2ke5gPf7tyuaXN9LlIommwvdciJBDqgqh3P3mdRYcGUCN066PT/lyt919jHbWq9Pp
 ofVwDSCMdFh7v5vRqA5iHJaF3rKYO3uuwk9Zd/TXHI0aLr2Kxl7GvYb0cSQav/X85dIwFQXOrut
 E9K8XPNXWxpktkNhjhlFZ/GdIFlzAl1qkqnHXnYOLB2EawiDTlHtui8Fylyu0OUa8e8KZWwaka4
 T83dUtyiIma9r1TZAyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010048

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-adspnord2

for you to fetch changes up to c6bed7b5dc85b213bfa40e9032a42cf02595549d:

   qcom: add ADSP2 firmware for nord platform (2026-09-01 11:11:54 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: add ADSP2 firmware for nord platform

  WHENCE                  |   3 +++
  qcom/nord/adsp2.mbn     | Bin 0 -> 3363776 bytes
  qcom/nord/adsp2_dtb.mbn | Bin 0 -> 40960 bytes
  qcom/nord/adsp2r.jsn    |  22 ++++++++++++++++++++++
  4 files changed, 25 insertions(+)
  create mode 100644 qcom/nord/adsp2.mbn
  create mode 100644 qcom/nord/adsp2_dtb.mbn
  create mode 100644 qcom/nord/adsp2r.jsn
