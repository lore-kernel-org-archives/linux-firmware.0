Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C75606A31B
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Nov 2026 17:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi5rb7dr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/kR4TeY
Received: by smtp.kernel.org (Postfix)
	id 9DA621F00919; Tue,  3 Nov 2026 17:42:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793727760;
	b=1PK+M+AHF/izsOrKzVO/IhMTlwoeIjgBnTvSYlcSbGUE9GQNN747aZhagcpM+1PtETVM
	 ZDVbHBdYLj+7xHh4CzWOU2WfYc5Ia5feBpK4LVeq8IZ111PLu9JBPf4MyF3UUTjkKSfU6
	 hZ4Y4a+vhA6fmeGb4bfxzJDKKvY+iDAHJPipnxAzUKQSD+6cVQRbmoUBfdnmCkTxxcyIB
	 J4AyiXrvHEtub/LjanjuzuBdGEYW2qMHboSfPlYhovF+h2T25kYumLiAlkr/CL0bnRR8/
	 e2yaiiQiLrt2KiiVTfj4vT07/1iQBspKvP6F7OVaRx90B5KD17UM+iPQXBi41r9i5ug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793727760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jm8wiUTPndWveoPkNBvBPHwPlZZuZ5qV/XWLDHLS+m4=;
	b=nDgPx2DS5agTK2i+XMAII9ykK8s3qHuPHDIu8JKCFsNRt1BQN2etOX7QLoBnW0V68ZTD
	 1YcmriOco+q/cC0TxEaOFnVwneb/aL/BywHXhaf9YK1uiqlIrOhWls7TclP3O7uxN4yE+
	 lgRwwK//2VKGdVZf8tdibXE8iNyq9r6TinNwEG2CthgMznIpwG576hyiXVAwMwHeL7ZLk
	 r4rQix5Npc7NRSygHt2sf/tqnygth5ZleBRdXitA65SUwfX9O2teFRvHlo1okBo+LqMcO
	 L9cJW5hdBzgnV/V833nQ9EB8wSOKpBY/drmkfSPMhi7W42sorN752m4PRZFJIofClkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi5rb7dr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/kR4TeY";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0632A1F000C1
	for <linux-firmware@kernel.org>; Tue,  3 Nov 2026 17:42:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi5rb7dr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/kR4TeY
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0632A1F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPXMB344466
	for <linux-firmware@kernel.org>; Tue, 3 Nov 2026 17:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jm8wiUTPndWveoPkNBvBPH
	wPlZZuZ5qV/XWLDHLS+m4=; b=Xi5rb7drV37Iv5XkQqXsyjRd5hW/QxKvBD4kvk
	Ea2oweP4Paq2a5pP5KEwDKtwEcJJ+arrPHQtL1cvSKfPiwkLyRdjJvSUdStn9tfa
	6DKHZFp0rdI5nsmGXq6YvduaDFE/kaZ2N00bSDg/SPG8XpQ5qTH4KcCTErz0XblJ
	kW5zV5utyrMkn1iGFoWlYpQaWCC7vPlgW7VR0Y677XfNZ0aIfcPnTqDN+3qYL1M8
	DsJ21GPTQBx+Vw1CGO2SiJuRFcjrYYdfqdreZk36VX90xjAwzJVRORZtigwj7fTR
	LRDyqjCKk5DZj8JSkook1UUP+v6xinhdPLv357fwWH2IiFoA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76dbett-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Nov 2026 17:42:38 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so5879774c88.1
        for <linux-firmware@kernel.org>; Tue, 03 Nov 2026 09:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793727758; x=1794332558; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jm8wiUTPndWveoPkNBvBPHwPlZZuZ5qV/XWLDHLS+m4=;
        b=K/kR4TeYw3rGmQRf9BTt2Gve1fUAH8VwfDl9Pv/rv8+ZmQNtJLPRaCaVg3VuH0RCVh
         XGIwcvRRywdq1YAIzFrYPK7CfpfUMrB0uCIIeIVEZos433XPWAZ51YehPfEUwoMS4AKT
         Du9t8NfLEeY5h2AQzAy+4ZbZlHxOSgKgTc6PJ6YH4cYHMgtwnT8nS8fnZ6jtIOwanLaJ
         GvZRpXx7Ld8JHW/wPIc/LrOOuzgeCBnSEk7CBj07/IZCbaH/OW0LnM3BBUYDag9y5GmQ
         ueWgm+VG+j0IeX6rfje+qKpsODZhyzIyyGWjk9O2sXcBzUUe3HPZgFUH5qRudAzsvQaB
         2Trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727758; x=1794332558;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jm8wiUTPndWveoPkNBvBPHwPlZZuZ5qV/XWLDHLS+m4=;
        b=0KmengUlQjsKOc+B6fUFdrKLxBPSE3Zoda/ueOMuXc6ujDl7YNCuAzYh0rRBUCc1LT
         433Mc/SRBanyGYl6Z1OFmENRPAG+JVR8Lpx2QRcUqnvZ+3Qb+cDDRbVNMa9BZSrh4eK9
         /rZxWH8F3YXqClX5enE1nkUoaKlRzPuL8vis+HxzicA4c0i+vw3uQrKTawGECCBXWl+L
         CS1g6iW0VwfcmnjJAVn4yYN/AYBGgcQSLSKl3fnD+8ErFTilD20iUr9O9YXs8q0hELh4
         vZiFh/DnPDbN5tS98mBa//sDO1Evz1sis+epmtAMIijcMr7S1bdhEXUHcB6tmvNRWuLZ
         zFcw==
X-Gm-Message-State: APuU4Z+leFlQJBbQeOsDvWWG+frUtco4RXuF54+P4O2FIxYwaSsSRLaK
	3QZvYYjIdqs3BZB7nl6kWU+LUDuXjxO8EqJ5gttxVdaJlKreMdlD7EKdcjcCtxIG0I7blTU4Whr
	raxZh3UTb/8GgW3X4GARnWu0Ez+nMmRTf42iEm3SNz07daIbVb+S9Hz/BPftf/LmUKgJesoA=
X-Gm-Gg: AYBFou2SfWDuN5YG6qbp4tOg3XAmmMe4edZjUG81jDBnhy2tiZorOwaFVkOO7axqKHY
	E4/tTN1UudU61xWnZyZkrGnEpS7SDYInCCrgAupw+rnQv4Cl/d1jTBUuLsA/yHTUe/sTnauFRJ9
	GnZkvbcc6oQ+umSgn20xipoG5FKnMdq7xuRiJSI8eZguH6f3xgpl+c+a/qZbKrCllaGAtYrk2pd
	sYb43w0T2iZu8IY/2WNcTZ/PGZ9IvMs12yGcBZIETWy8c3DC+BghGPCk5x/2BnMvFaxPLG/T1yV
	Nxd5UosN5PhTlVu6ny12HhiO6gXcOPjhGCf+itx4VhvCqb94v/R/rAa5jb2Pe6DYSIitxsaElbg
	80nSlhTgPRGjcwwgQuQ1aA9P3+PDwD5bc+j/JQ7RRDBf8LQVKs1ajOHjI0s7xh1v/SDnurljS+6
	Um
X-Received: by 2002:a05:7022:eb44:10b0:166:29a2:f83f with SMTP id a92af1059eb24-1ac55774bdfmr21748204c88.5.1793727757938;
        Tue, 03 Nov 2026 09:42:37 -0800 (PST)
X-Received: by 2002:a05:7022:eb44:10b0:166:29a2:f83f with SMTP id a92af1059eb24-1ac55774bdfmr21748163c88.5.1793727757211;
        Tue, 03 Nov 2026 09:42:37 -0800 (PST)
Received: from [10.216.55.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm405897c88.5.2026.11.03.09.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:42:36 -0800 (PST)
Message-ID: <c309b1ac-a416-4a37-9369-2de2511e5d7b@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 23:12:33 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: Update HPASS firmware for Qualcomm nord platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6aea1d0e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=-Drb0nzxk0q1A1DO3L8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MCBTYWx0ZWRfX3BshaL1csvpa
 YQXEdDk1HhGk3Ykv8iK7/0frG3JDRWIWB4zhS5I2TgUN2SNHldG1aebaLVbuzdV/ps8TuHX9yBg
 xyLEAvAGbHDE8msmyoTbdPPDNM4D7vU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MCBTYWx0ZWRfX6uQgiJF0pqjC
 bNqR8dsJQSIhiMutpKyQaca9sH3kW0iXDtWB1sC4I2C3WkFbrEoyDFVodODaJi85q0AgWj37FnA
 +dxopdijL8eEwaBkgrph/nlsYX9TWX9JzQ3T0BuHDepjqQ5Q+EvtMyeYhzehQOuTBr69mE+OA7e
 hRKbT2GTLCKPnZSc6C82KEsWlcB2Ui0Scv6eFOe+hTODN5/hC7eeZ9ZmMiVuBoY8jcDaQcB1d4A
 zy6V3Ntp3nPEYeFmJXUZSAVg0eYn694uLuuwtfSeYZFFkMA5WRnfbnFbVY+RVbJf10Ze76uv3Ru
 L/kYCe9J32MfDtlZQTcKlf6CFNdHwzAJvOwvebGSNoWqSHPeEVKOGeSK2eBzOoI0hdArhMjewZv
 3Shk1YSkBdUfik9tI0Uk4h9ECEsF7h65cf9bd1njRT8DK0nwdvudFPWGZmiZ239e8hKlzRy/z4I
 T9oBiy23kwBv/SotTFg==
X-Proofpoint-GUID: oHsKD3pzJxeDNYqJX_SjShQI8nG1vxkX
X-Proofpoint-ORIG-GUID: oHsKD3pzJxeDNYqJX_SjShQI8nG1vxkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030070
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 02665d2016e1360cd2135998f36cfa303b5be6e1:

   Merge branch 'main' into 'main' (2026-11-03 05:36:41 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qli-fw-nord-upstream

for you to fetch changes up to 4a0f6cd38a05c17295a0383aaadb2bb69b06dc5e:

   Update HPASS firmware for Qualcomm nord platform. (2026-11-03 
23:09:45 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       Update HPASS firmware for Qualcomm nord platform.

  WHENCE                 |   2 +-
  qcom/nord/adsp.mbn     | Bin 8950424 -> 7930520 bytes
  qcom/nord/adsp_dtb.mbn | Bin 85864 -> 85864 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
